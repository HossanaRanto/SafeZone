import 'package:flutter/material.dart';
import 'package:safezone/constant/app_assets.dart';

class CircleImageCard extends StatelessWidget {
  final Widget image;
  final void Function()? onClick;
  final bool? isImageFit;
  final Color? borderColor;

  const CircleImageCard({
    super.key,
    this.onClick,
    required this.image,
    this.isImageFit = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick ?? () {},
      child: SizedBox(
        width: 150,
        height: 150,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: EdgeInsets.all(isImageFit! ? 0 : 15),
            child: image,
          ),
        ),
      ),
    );
  }
}
