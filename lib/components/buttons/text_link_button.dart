import 'package:flutter/material.dart';
import 'package:safezone/components/text/custom_text.dart';

class TextLinkButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? size;
  final void Function() onPressed;
  final TextDecoration? decoration;

  const TextLinkButton(
      {super.key,
      required this.text,
      this.textColor,
      this.size = 15,
      required this.onPressed,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: CustomText(
        text: text,
        size: size,
        color: textColor ?? Colors.black,
        overflow: TextOverflow.clip,
        decoration: decoration ?? TextDecoration.none,
      ),
    );
  }
}
