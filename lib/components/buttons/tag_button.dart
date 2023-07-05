import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:safezone/components/text/custom_text.dart';
import 'package:safezone/constant/app_colors.dart';

class TagButton extends StatelessWidget {
  final String text;
  final bool fillColor;
  final Color? color;
  final Function()? onTap;

  const TagButton(
      {Key? key,
      required this.text,
      required this.fillColor,
      this.onTap,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Chip(
        backgroundColor:
            fillColor ? (color ?? AppColor.blue) : Colors.transparent,
        side: BorderSide(
            color:
                fillColor ? Colors.transparent : (color ?? AppColor.lightGrey),
            width: 0.5),
        label: Padding(
          padding:
              const EdgeInsets.only(top: 6, bottom: 6, right: 10, left: 10),
          child: CustomText(
            text: text,
            color: fillColor ? Colors.white : AppColor.dark,
          ),
        ),
      ),
      onTap: () => onTap!(),
    );
  }
}
