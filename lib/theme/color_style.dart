// Flutter imports:
import 'package:flutter/material.dart';

const Color mainColor = Color(0xFFE03177);
const Color redEmotionColor = Color(0xFFDA3075);
const Color yellowEmotionColor = Color(0xFFF2B414);
const Color yellowEmotionTextColor = Color(0xFF5E4400);
const Color greenEmotionColor = Color(0xFF60BA7F);
const Color greenEmotionTextColor = Color(0xFF045C1F);
const Color blueEmotionColor = Color(0xFF1E6DC8);

const Color coolGray300 = Color(0xFFADB6C8);
const Color coolGray500 = Color(0xFF8B95A1);

const Color gray850 = Color(0xFF1F1F1F);
const Color gray700 = Color(0xFF555555);
const Color gray600 = Color(0xFF777777);
const Color gray500 = Color(0xFF949494);
const Color gray400 = Color(0xFFB7B7B7);
const Color gray300 = Color(0xFFDFDFDF);
const Color gray200 = Color(0xFFEFEFEF);
const Color gray100 = Color(0xFFF5F5F5);
const Color whiteColor = Color.fromARGB(255, 255, 255, 255);

const Color error = Color(0xFFE4564F);
const Color bottomSheetColor = Color(0xFF2C2F32);

const Color momentBoxBackgroundColor = Color(0xFF2A323A);
const Color backgroundColor = Color(0xFF182029);

class EmotionTypeColor {
  //redColor

  static String red1Color = '#DA3075';
  static String red2Color = '#FF5631';
  static String red3Color = '#308FA4';
  static String red4Color = '#C3258E';

  //yellowColor
  static String yellow1Color = '#F2B414';
  static String yellow2Color = '#FF783E';
  static String yellow3Color = '#FFAD31';
  static String yellow4Color = '#33ABC6';

  //greenColor
  static String green1Color = '#60BA7F';
  static String green2Color = '#7D91C3';
  static String green3Color = '#259480';
  static String green4Color = '#257AB8';

  //blueColor
  static String blue1Color = '#1E6DC8';
  static String blue2Color = '#8D68DD';
  static String blue3Color = '#28A4BF';
  static String blue4Color = '#8458FF';
}

const backgroundGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [
      0,
      0.5,
      1
    ],
    colors: [
      Color(0xff32A7C0),
      Color(0xff1E6DC8),
      Color(0xffDA3075),
    ]);
final backgroundGradientWithOpacity = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: const [
      0,
      0.5,
      1
    ],
    colors: [
      const Color(0xff32A7C0).withOpacity(0.15),
      const Color(0xff1E6DC8).withOpacity(0.15),
      const Color(0xffDA3075).withOpacity(0.15),
    ]);

const emptyRedAngularGradient = SweepGradient(
  colors: [
    Color(0xffFF6984),
    Color(0xffF15379),
    Color(0xffE0315B),
    Color(0xffBE2046),
  ],
  stops: [
    0.0,
    0.25,
    0.75,
    1.0,
  ],
  // startAngle: 0.5,
  // endAngle: ,
  transform: GradientRotation(1.6),
);

const emptyYellowAngularGradient = SweepGradient(
  colors: [
    Color(0xffF6E27B),
    Color(0xffF9D669),
    Color(0xffF6C958),
    Color(0xffF5B746),
  ],
  stops: [
    0.0,
    0.25,
    0.75,
    1.0,
  ],
  // startAngle: 0.5,
  // endAngle: ,
  transform: GradientRotation(1.6),
);
const emptyBlueAngularGradient = SweepGradient(
  colors: [
    Color(0xff83B6FE),
    Color(0xff7BA1F9),
    Color(0xff6A87F6),
    Color(0xff5A6AF3),
  ],
  stops: [
    0.0,
    0.25,
    0.75,
    1.0,
  ],
  // startAngle: 0.5,
  // endAngle: ,
  transform: GradientRotation(1.6),
);

const emptyGreenAngularGradient = SweepGradient(
  colors: [
    Color(0xff9CEBA7),
    Color(0xff88E4A3),
    Color(0xff75D89B),
    Color(0xff6BC68C),
  ],
  stops: [
    0.0,
    0.25,
    0.75,
    1.0,
  ],
  // startAngle: 0.5,
  // endAngle: ,
  transform: GradientRotation(1.6),
);
