import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class TextUtilsIOS {
  static double textLetterSpacing = 1.0;
  static double textHeight = 1.0;

  /// Text correction section
  ///
  /// We correct text [letterSpacing] and [Offset]
  static double assignTextLetterSpacing(fontSize) {
    if (fontSize! < 5)
      textLetterSpacing = 0;
    else if (fontSize! >= 5 && fontSize! < 9)
      textLetterSpacing = 0.22;
    else if (fontSize! >= 10 && fontSize! < 12)
      textLetterSpacing = -0.05;
    else if (fontSize! >= 12 && fontSize! < 15)
      textLetterSpacing = -0.15;
    else if (fontSize! >= 15 && fontSize! < 16)
      textLetterSpacing = -0.26;
    else if (fontSize! >= 16 && fontSize! < 17)
      textLetterSpacing = -0.4;
    else if (fontSize! >= 17 && fontSize! < 20)
      textLetterSpacing = -0.6;
    else if (fontSize! >= 20 && fontSize! < 25)
      textLetterSpacing = -1.1;
    else if (fontSize! >= 25 && fontSize! < 27)
      textLetterSpacing = -1.23;
    else if (fontSize! >= 27  && fontSize! < 30)
      textLetterSpacing = -1.05;
    else if (fontSize! >= 30  && fontSize! < 35)
      textLetterSpacing = -1.35;
    else if (fontSize! >= 35  && fontSize! < 48)
      textLetterSpacing = -1.8;
    else if (fontSize! >= 48  && fontSize! < 58)
      textLetterSpacing = -2.5;
    else if (fontSize! >= 58)
      textLetterSpacing = -4.5;

    return textLetterSpacing;
  }


  static double assignTextHeight(fontSize) {
    if (fontSize! < 14)
      textHeight = 1;
    else if (fontSize! >= 14 && fontSize! < 16)
      textHeight = 1.12;
    else if (fontSize! >= 16 && fontSize! < 18)
      textHeight = 1.0;
    else if (fontSize! >= 18 && fontSize! < 25)
      textHeight = 1.11;
    else if (fontSize! >= 25 && fontSize! < 27)
      textHeight = 1.24;
    else if (fontSize! >= 27 && fontSize! < 30)
      textHeight = 1.17;
    else if (fontSize! >= 30)
      textHeight = 1.17;

    return textHeight;
  }


  /// Emojis correction section
  ///
  /// We correct emojis [fontSize], [letterSpacing] and [Offset]
  static double assignEmojiSize(double fontsize) {
    double size = 1.0;
    if (fontsize < 10)
      size = 1.28;
    else if (fontsize >= 10 && fontsize < 15)
      size = 1.28;
    else if (fontsize >= 15 && fontsize < 16)
      size = 1.255;
    else if (fontsize >= 16 && fontsize < 18)
      size = 1.245;
    else if (fontsize >= 18 && fontsize < 20)
      size = 1.169;
    else if (fontsize >= 20 && fontsize < 22)
      size = 1.11;
    else if (fontsize >= 22 && fontsize < 25)
      size = 1.02;
    else if (fontsize >= 25 && fontsize < 28)
      size = 1.0;
    else if (fontsize! >= 28)
      size = 1.0;

    return size;
  }


  static double assignEmojiLetterSpacing(double fontsize) {
    double emojiletterSpacing = 1.0;
    if (fontsize < 10)
      emojiletterSpacing = -1.8;
    else if (fontsize >= 10 && fontsize < 12)
      emojiletterSpacing = -1.7;
    else if (fontsize >= 12 && fontsize < 15)
      emojiletterSpacing = -1.98;
    else if (fontsize >= 15 && fontsize < 16)
      emojiletterSpacing = 0.725;
    else if (fontsize >= 16 && fontsize < 18)
      emojiletterSpacing = 0.28;
    else if (fontsize! >= 18 && fontsize < 22)
      emojiletterSpacing = 1.0;
    else if (fontsize! >= 22 && fontsize < 25)
      emojiletterSpacing = 1.25;
    else if (fontsize >= 25 && fontsize < 28)
      emojiletterSpacing = 3.0;
    else if (fontsize >= 28 && fontsize < 35)
      emojiletterSpacing = 3.6;
    else if (fontsize >= 35)
      emojiletterSpacing = 4;

    return emojiletterSpacing;
  }


  static double assignEmojiOffset(double fontsize) {
    double offset = 1.0;
    if (fontsize < 9)
      offset = 0;
    else if (fontsize >= 9 && fontsize < 12)
      offset = -0.2;
    else if (fontsize >= 12 && fontsize < 15)
      offset = -0.5;
    else if (fontsize >= 15 && fontsize < 16)
      offset = -0.22;
    else if (fontsize >= 16 && fontsize < 18)
      offset = 0;
    else if (fontsize! >= 18 && fontsize < 25)
      offset = 1.1;
    else if (fontsize! >= 25 && fontsize < 28)
      offset = 0.9;
    else if (fontsize >= 28 && fontsize < 35)
      offset = 1.4;
    else if (fontsize >= 35)
      offset = 0;

    return offset;
  }
}
