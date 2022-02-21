import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_score/themes/app_constants.dart';

class SvgPictureWidget extends StatelessWidget {
  const SvgPictureWidget({
    Key? key,
    required this.url,
    required this.code,
    this.height,
    this.width,
  }) : super(key: key);

  final String? url;
  final String code;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    Widget image;
    Widget ret;

    try {
      if (url != null) {
        image = SvgPicture.network(
          url!,
          placeholderBuilder: (context) => Text(code),
          // width: 100,
          // height: 100,
        );
      } else {
        image = Text(
          code,
        );
      }
    } catch (e) {
      image = Text(code);
    }

    ret = Container(
      width: width ?? 50,
      height: height ?? 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        // color: image is Text ? defaultColor : Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: defaultColor),
      ),
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // borderRadius: BorderRadius.circular(50.0),
        child: Center(child: image),
      ),
    );
    return ret;
  }
}
