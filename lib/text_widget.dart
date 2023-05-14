import 'dart:io';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_label_test/text_widget_utils_Android.dart';
import 'package:ui_label_test/text_widget_utils_IOS.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    Key? key,
    required this.text,
    this.style = const TextStyle(),
  }) : super(key: key);

  final String text;
  final TextStyle style;

  TextStyle get textStyle => style;

  @override
  Widget build(BuildContext context) {
      bool isIOS = Platform.isIOS ? true : false;

      //Note: text [letterSpacing] and [height] are calculated based on
      //text [fontsize]

      // Adjust text letterSpacing, it doesnt affect emojis letterSpacing
      double textLetterSpacing = isIOS?
                                  TextUtilsIOS.assignTextLetterSpacing(style!.fontSize!)
                                  :
                                  TextUtilsAndroid.assignTextLetterSpacing(style!.fontSize!);

      // Adjust text height, it doesnt affect emojis letterSpacing
      double textHeight = isIOS?
                            TextUtilsIOS.assignTextHeight(style!.fontSize!)
                            :
                            TextUtilsAndroid.assignTextHeight(style!.fontSize!) ;

      // letterSpacing and height are calculated based on fontSize
      TextStyle _textStyle = TextStyle(
        fontSize: textStyle.fontSize,
        letterSpacing: textLetterSpacing,
        height: textHeight,
      );

      return Text.rich(
        CustomTextSpan(
          text: '$text',
          style: _textStyle,
        ),
      );
  }
}

class CustomTextSpan extends TextSpan {

  CustomTextSpan({
    TextStyle? style,
    String? text,
    List<TextSpan>? children,
  }) : super(
    style: style,
    children: [
      ..._parse(
        style,
        text,
      ),
      ...?children
    ],
  );


  // Regex formula to extract emojis from text.
  // Note: All formulas provided on github issue #29984 are wrong.
  // https://github.com/flutter/flutter/issues/28894#issuecomment-1538784818
  static final regex = RegExp(
      '((?:\u00a9|\u00ae|[\u2000-\u3300]|\ufe0f|[\ud83c-\ud83e][\udc00-\udfff]|\udb40[\udc61-\udc7f])+)');

  static List<TextSpan> _parse(
      TextStyle? style, String? text) {

    bool isIOS = Platform.isIOS ? true : false;

    // Note: emojis [letterSpacing], [height] are calculated based on
    // text [fontsize],
    // [Offset] id used to repositioning the emojis, because its baseline breaks
    // after emojis size gets increased
    //
    // [TextUtilsIOS] and [TextUtilsAndroid] just to better isolate the numbers
    // used for the two platforms.

    double emojiSizeMultiplier = isIOS?
                                  TextUtilsIOS.assignEmojiSize(style!.fontSize!)
                                  :
                                  TextUtilsAndroid.assignEmojiSize(style!.fontSize!);

    double emojiLetterSpacing = isIOS?
                                  TextUtilsIOS.assignEmojiLetterSpacing(style!.fontSize!)
                                  :
                                  TextUtilsAndroid.assignEmojiLetterSpacing(style!.fontSize!);

    double emojiOffsetMultiplier = isIOS?
                                    TextUtilsIOS.assignEmojiOffset(style!.fontSize!)
                                    :
                                    TextUtilsAndroid.assignEmojiOffset(style!.fontSize!);

    final emojiStyle = style?.copyWith(
      fontSize: (style.fontSize)! * emojiSizeMultiplier,
      letterSpacing: emojiLetterSpacing,
    );
    final spans = <InlineSpan>[];

    //Emoji matches from the regex are grouped, in order to position text as inline we need to
    //render every emoji character as a separate span.
    text?.splitMapJoin(
      regex,
      onMatch: (m) {
        spans.addAll(
          m
              .group(0)!
              .characters
              .map(
                (e) => WidgetSpan(
              baseline: TextBaseline.ideographic,
              alignment: PlaceholderAlignment.top,
              child: Builder(builder: (context) {

                return Transform.translate(
                  offset: Offset(
                      0,
                      emojiOffsetMultiplier),
                  child: Text(
                    e,
                    style: emojiStyle,
                  ),
                );
              }),
            ),
          )
              .toList(),
        );
        return '';
      },
      onNonMatch: (s) {
        spans.add(
          TextSpan(text: s, style: style),
        );
        return '';
      },
    );

    return [TextSpan(children: spans, style: style)];
  }
}