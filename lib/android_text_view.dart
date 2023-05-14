import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidTextView extends StatefulWidget {
  const AndroidTextView({
    required Key key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  final String text;
  final double fontSize;

  @override
  State<StatefulWidget> createState() => AndroidTextViewState();
}

class AndroidTextViewState extends State<AndroidTextView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'com.android.platformview/textview',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported!');
  }

  void _onPlatformViewCreated(int id) {
    TextViewController._(id).setText(widget.text);
    TextViewController._(id).setFontSize(widget.fontSize);
  }
}

class TextViewController {
  TextViewController._(int id)
      : _channel = new MethodChannel('com.android.platformview/textview_$id');

  final MethodChannel _channel;

  Future<void> setText(String text) async {
    assert(text != null);
    return _channel.invokeMethod('setText', text);
  }

  Future<void> setFontSize(double fontSize) async {
    assert(fontSize != null);
    return _channel.invokeMethod('setFontSize', fontSize);
  }
}