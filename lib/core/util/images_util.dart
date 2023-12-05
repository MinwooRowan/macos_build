import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageUtil {
  Widget getSvgAssetWidget(String path,
      {double? width, double? height, BoxFit? fit, Color? color}) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  Widget getImageAssetWidget(
    String path, {
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      color: color,
    );
  }
}
