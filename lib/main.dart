import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_label/flutter_native_label.dart';
import 'package:ui_label_test/text_widget.dart';

import 'android_text_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double fontSize = 15.0;
  double _sliderValue = 21;
  String _status = '17';
  bool enableFix = true;
  bool isIOS = false;
  //late TextViewController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle_1 =  TextStyle(
      fontSize: _sliderValue,
    );

    isIOS = (Platform.isIOS) ? true : false;

    setState(() {
      _status = '${_sliderValue.round()}';
      fontSize = _sliderValue;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CupertinoSwitch(
                    trackColor: Colors.black12,
                    value: enableFix,
                    onChanged: (value) => setState(() => enableFix = value),
                  ),
                  Expanded(
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      value: _sliderValue,
                      label: '${_sliderValue.round()}',
                      onChanged: (value) {
                        setState(() {
                          _status = '${_sliderValue.round()}';
                          _sliderValue = value;
                          fontSize = _sliderValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text(
                'Fontsize: $_status',
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                enableFix? 'Flutter text, fix is enabled'
                      : 'Flutter text, fix is disabled',
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: enableFix? Colors.green : Colors.green,
                child: Visibility (
                  visible: enableFix,
                  child: TextWidget(
                    text:'Lorem ipsum dolor sit amet,👍👍👍👍 consectetur adipiscing elit,'
                              '👍👍👍👍🥳🤷‍♂️💪🤦‍♂️👏😊❤️ sed do eiusmod tempor '
                              '🥳🤷‍♂️💪🤦‍♂️👏😊❤️incididunt ut labore et dolore magna aliqua '
                              'Ut enim ad minim veniam, quis',
                    style: textStyle_1,
                  ),
                  replacement: Text(
                    'Lorem ipsum dolor sit amet,👍👍👍👍 consectetur adipiscing elit,'
                    '👍👍👍👍🥳🤷‍♂️💪🤦‍♂️👏😊❤️ sed do eiusmod tempor '
                    '🥳🤷‍♂️💪🤦‍♂️👏😊❤️incididunt ut labore et dolore magna aliqua '
                      'Ut enim ad minim veniam, quis',
                     style: textStyle_1,
                     textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Native text',
              ),
              Visibility(
                visible: isIOS,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.green,
                  child: NativeLabel(
                    'Lorem ipsum dolor sit amet,👍👍👍👍 consectetur adipiscing elit,'
                        '👍👍👍👍🥳🤷‍♂️💪🤦‍♂️👏😊❤️ sed do eiusmod tempor '
                        '🥳🤷‍♂️💪🤦‍♂️👏😊❤️incididunt ut labore et dolore magna aliqua '
                        'Ut enim ad minim veniam, quis',
                    style: textStyle_1,
                    key: GlobalKey(),
                  ),
                ),
                replacement: Container(
                  constraints: BoxConstraints(
                      minHeight: 100, maxHeight: 3000
                  ),
                  padding: EdgeInsets.all(10),
                  color: Colors.green,
                  child: AndroidTextView(
                    text:'Lorem ipsum dolor sit amet,👍👍👍👍 consectetur adipiscing elit,'
                          '👍👍👍👍🥳🤷‍♂️💪🤦‍♂️👏😊❤️ sed do eiusmod tempor '
                          '🥳🤷‍♂️💪🤦‍♂️👏😊❤️incididunt ut labore et dolore magna aliqua '
                          'Ut enim ad minim veniam, quis',
                    fontSize: fontSize,
                    key: GlobalKey(),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
