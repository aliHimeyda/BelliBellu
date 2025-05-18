const express = require("express");
const sql = require("mssql");
const cors = require("cors");
require("dotenv").config();

const app = express();
app.use(cors());
app.use(express.json());

console.log("Veritabanı sunucusu:", process.env.DB_SERVER);

const config = {
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  server: process.env.DB_SERVER,
  database: process.env.DB_NAME,
  options: {
    encrypt: false,
    trustServerCertificate: true,
  },
};

app.get("/Kullanici", async (req, res) => {
  try {
    await sql.connect(config);
    const result = await sql.query("SELECT * FROM Kullanici");
    res.json(result.recordset);
  } catch (err) {
    console.error("API HATASI:", err);
    res.status(500).json({ error: err.message });
  }
});

app.get("/musteri_bilgileri/:email", async (req, res) => {
  const { email } = req.params;
  try {
    await sql.connect(config);
    const result = await sql.query(`
      SELECT * FROM musteri_bilgileri WHERE email = '${email}'
    `);
    res.json(result.recordset[0]);
  } catch (err) {
    console.error("VERİ ÇEKME HATASI:", err);
    res.status(500).json({ error: err.message });
  }
});
app.post("/Kullanici", async (req, res) => {
  const { ad, soyad, email } = req.body;
  try {
    await sql.connect(config);
    const result = await sql.query(`
      INSERT INTO Kullanici (ad, soyad, email)
      VALUES ('${ad}', '${soyad}', '${email}')
    `);
    res.status(201).json({ message: "Kayıt başarıyla eklendi" });
  } catch (err) {
    console.error("KAYIT EKLEME HATASI:", err);
    res.status(500).json({ error: err.message });
  }
});
app.put("/Kullanici/:id", async (req, res) => {
  const { id } = req.params;
  const { ad, soyad, email } = req.body;
  try {
    await sql.connect(config);
    const result = await sql.query(`
      UPDATE Kullanici
      SET ad = '${ad}', soyad = '${soyad}', email = '${email}'
      WHERE id = ${id}
    `);
    res.json({ message: "Kayıt güncellendi" });
  } catch (err) {
    console.error("GÜNCELLEME HATASI:", err);
    res.status(500).json({ error: err.message });
  }
});
app.delete("/Kullanici/:id", async (req, res) => {
  const { id } = req.params;
  try {
    await sql.connect(config);
    const result = await sql.query(`
      DELETE FROM Kullanici WHERE id = ${id}
    `);
    res.json({ message: "Kayıt silindi" });
  } catch (err) {
    console.error("SİLME HATASI:", err);
    res.status(500).json({ error: err.message });
  }
});

app.listen(3000, () => {
  console.log("API http://localhost:3000 üzerinden çalışıyor");
});
