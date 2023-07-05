import 'package:flutter/material.dart';
import 'package:safezone/components/text/custom_text.dart';
import 'package:safezone/constant/app_colors.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final double? size;
  final Color? color;
  final Color? backgroundColor;
  final void Function()? onClick;

  const RoundedButton(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.backgroundColor,
      this.onClick});

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onClick,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: widget.backgroundColor ?? AppColor.blue,
          ),
          child: Center(
            child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: CustomText(
                  bold: true,
                  text: widget.text,
                  size: widget.size ?? 15,
                  color: widget.color ?? Colors.white,
                )),
          ),
        ));
  }
}
