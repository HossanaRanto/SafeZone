import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String text;
  final double? size;
  final double? height;
  final bool? bold;
  final Color? color;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  const CustomText(
      {Key? key,
      required this.text,
      this.size,
      this.bold = false,
      this.color,
      this.height,
      this.overflow,
      this.maxLines,
      this.softWrap = false,
      this.textAlign,
      this.decoration})
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      maxLines: widget.maxLines ?? 1,
      softWrap: widget.softWrap,
      style: TextStyle(
        fontSize: widget.size ?? 13,
        color: widget.color ?? Colors.black,
        fontWeight: widget.bold! ? FontWeight.bold : FontWeight.normal,
        fontFamily: "Poppins",
        decoration: widget.decoration ?? TextDecoration.none,
      ),
      overflow: widget.overflow ?? TextOverflow.visible,
      textAlign: widget.textAlign ?? TextAlign.start,
    );
  }
}
