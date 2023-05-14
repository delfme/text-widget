import 'dart:ui';

import 'package:flutter/material.dart';

class TextUtilsAndroid {
  static double textLetterSpacing = 1.0;
  static double textHeight = 1.0;

  /// Text correction section
  ///
  /// We correct text [letterSpacing] and [Offset]
  static double assignTextLetterSpacing(fontSize) {
      if (fontSize! < 5)
        textLetterSpacing = -0.3;
      else if (fontSize! >= 5 && fontSize! < 9)
        textLetterSpacing = -0.15;
      else if (fontSize! >= 10 && fontSize! < 18)
        textLetterSpacing = -0.0;
      else if (fontSize! >= 18 && fontSize! < 20)
        textLetterSpacing = 0.1;
      else if (fontSize! >= 20 && fontSize! < 30)
        textLetterSpacing = 0.3;
      else if (fontSize! >= 30  && fontSize! < 35)
        textLetterSpacing = 0.0;
      else if (fontSize! >= 35)
        textLetterSpacing = -0.1;

    return textLetterSpacing;
  }

  static double assignTextHeight(fontSize) {
      if (fontSize! < 14)
        textHeight = 1;
      else if (fontSize! >= 14 && fontSize! < 18)
        textHeight = 1.13;
      else if (fontSize! >= 18 && fontSize! < 25)
        textHeight = 1.13;
      else if (fontSize! >= 25)
        textHeight = 1.14;

    return textHeight;
  }


  /// Emojis correction section
  ///
  /// We correct emojis [fontSize], [letterSpacing] and [Offset]
  static double assignEmojiSize(double fontsize) {
    double size = 1.0;
      if (fontsize < 10)
        size = 1.0;
      else if (fontsize >= 10 && fontsize < 15)
        size = 1.0;
      else if (fontsize >= 15 && fontsize < 16)
        size = 1.0;
      else if (fontsize >= 16 && fontsize < 18)
        size = 0.97;
    else if (fontsize! >= 18)
        size = 1.0;

    return size;
  }


  static double assignEmojiLetterSpacing(double fontsize) {
    double emojiletterSpacing = 1.0;
      if (fontsize < 10)
        emojiletterSpacing = -0.3;
      else if (fontsize >= 10 && fontsize < 12)
        emojiletterSpacing = -0.6;
      else if (fontsize >= 12 && fontsize < 18)
        emojiletterSpacing = -0.5;
      else if (fontsize! >= 18 && fontsize < 22)
        emojiletterSpacing = -0.4;
      else if (fontsize >= 22)
        emojiletterSpacing = -0.6;

    return emojiletterSpacing;
  }


  static double assignEmojiOffset(double fontsize) {
    double offset = 1.0;
      if (fontsize < 9)
        offset = 0.5;
      else if (fontsize >= 9 && fontsize < 12)
        offset = 0.7;
      else if (fontsize >= 12 && fontsize < 15)
        offset = 0.2;
      else if (fontsize >= 15 && fontsize < 18)
        offset = -0.2;
      else if (fontsize! >= 18 && fontsize < 25)
        offset = 0.8;
      else if (fontsize! >= 25)
        offset = -0.7;

    return offset;
  }
}
