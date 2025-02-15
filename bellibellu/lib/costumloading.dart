import 'dart:async';
import 'package:flutter/material.dart';

class LoadingDialog {
  LoadingDialog._private();
  static final LoadingDialog _instance = LoadingDialog._private();
  static LoadingDialog get instance => _instance;
  OverlayEntry? _overlayEntry;
  StreamController<String>? _textController;

  Future<void> show({
    required BuildContext context,
    String text = "Yukleniyor..",
  }) async {
    if (_overlayEntry != null) {
      _textController?.add(text);
      return;
    }
    _textController = StreamController<String>();
    _overlayEntry = OverlayEntry(
      builder:
          (context) => Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ModalBarrier(dismissible: false, color: Colors.black),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      StreamBuilder(
                        stream: _textController!.stream,
                        builder:
                            (context, snapshot) => Text(
                              snapshot.data ?? text,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  Future<void> hide() async {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _textController?.close();
    _textController = null;
  }
}
