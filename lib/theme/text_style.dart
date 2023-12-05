// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:exe_test/theme/color_style.dart';
import 'package:flutter/material.dart';

// Package imports:

// Project imports:

const String jalnanFontFamily = 'Jalnan';
const String pretendardFontFamily = 'Pretendard';
const String bmJuaFontFamily = 'BMJUA';

extension EmotionBarnTextStyle on TextStyle {
  TextStyle get title1 => copyWith(
        fontSize: 32,
        fontFamily: jalnanFontFamily,
        height: 1.4,
        letterSpacing: 0,
        color: whiteColor,
      );
  TextStyle get title2 => copyWith(
        fontSize: 24,
        fontFamily: jalnanFontFamily,
        height: 1.4,
        letterSpacing: 0,
        color: whiteColor,
      );
  TextStyle get title3 => copyWith(
        fontSize: 20,
        fontFamily: jalnanFontFamily,
        height: 1.4,
        letterSpacing: 0,
        color: whiteColor,
      );
  TextStyle get title4 => copyWith(
        fontSize: 18,
        fontFamily: jalnanFontFamily,
        letterSpacing: 0,
        height: 1.4,
        color: whiteColor,
      );

  TextStyle get title5 => copyWith(
        fontSize: 15,
        fontFamily: jalnanFontFamily,
        height: 1.4,
        letterSpacing: 0,
        color: whiteColor,
      );
  TextStyle get title6 => copyWith(
        fontSize: 13,
        fontFamily: jalnanFontFamily,
        height: 1.4,
        letterSpacing: 0,
        color: whiteColor,
      );
  TextStyle get actionButton => copyWith(
        fontSize: 15,
        fontFamily: jalnanFontFamily,
        height: 1.0,
        letterSpacing: 0,
        color: whiteColor,
      );

  TextStyle get subTitle1 => copyWith(
        fontSize: 18,
        fontFamily: pretendardFontFamily,
        color: whiteColor,
        height: 1,
        fontVariations: <FontVariation>[const FontVariation('wght', 700)],
      );
  TextStyle get subTitle2 => copyWith(
        fontSize: 16,
        fontFamily: pretendardFontFamily,
        color: whiteColor,
        height: 1,
        fontVariations: <FontVariation>[const FontVariation('wght', 700)],
      );
  TextStyle get subTitle3 => copyWith(
        fontSize: 14,
        fontFamily: pretendardFontFamily,
        color: whiteColor,
        height: 1,
        fontVariations: <FontVariation>[const FontVariation('wght', 700)],
      );

  TextStyle get lead => copyWith(
        fontSize: 16,
        fontFamily: pretendardFontFamily,
        height: 1.6,
        letterSpacing: 0,
        color: whiteColor,
        fontVariations: <FontVariation>[const FontVariation('wght', 500)],
      );
  TextStyle get leadBold => copyWith(
        fontSize: 16,
        fontFamily: pretendardFontFamily,
        height: 1.6,
        letterSpacing: 0,
        color: whiteColor,
        fontVariations: <FontVariation>[const FontVariation('wght', 700)],
      );
  TextStyle get body => copyWith(
        fontSize: 14,
        fontFamily: pretendardFontFamily,
        color: whiteColor,
        letterSpacing: 0,
        height: 1.6,
        fontVariations: <FontVariation>[const FontVariation('wght', 500)],
      );
  TextStyle get bodyBold => copyWith(
        fontSize: 14,
        fontFamily: pretendardFontFamily,
        color: whiteColor,
        letterSpacing: 0,
        height: 1.6,
        fontVariations: <FontVariation>[const FontVariation('wght', 700)],
      );
  TextStyle get tiny => copyWith(
        fontSize: 14,
        fontFamily: pretendardFontFamily,
        color: whiteColor,
        letterSpacing: 0,
        height: 1.5,
        fontVariations: <FontVariation>[const FontVariation('wght', 400)],
      );
  TextStyle get button => copyWith(
        fontSize: 17,
        fontFamily: pretendardFontFamily,
        color: whiteColor,
        height: 1,
        fontVariations: <FontVariation>[const FontVariation('wght', 700)],
      );
  TextStyle get button2 => copyWith(
        fontSize: 15,
        fontFamily: pretendardFontFamily,
        color: whiteColor,
        height: 1,
        fontVariations: <FontVariation>[const FontVariation('wght', 700)],
      );

  TextStyle get description => copyWith(
        fontSize: 16,
        fontFamily: bmJuaFontFamily,
        color: whiteColor,
        height: 1.4,
        fontVariations: <FontVariation>[const FontVariation('wght', 500)],
      );

  TextStyle get detail => copyWith(
        fontSize: 12,
        fontFamily: pretendardFontFamily,
        color: whiteColor,
        height: 1.4,
        fontVariations: <FontVariation>[const FontVariation('wght', 500)],
      );
  TextStyle get detailBold => copyWith(
        fontSize: 12,
        fontFamily: pretendardFontFamily,
        color: whiteColor,
        height: 1.4,
        fontVariations: <FontVariation>[const FontVariation('wght', 700)],
      );
}
