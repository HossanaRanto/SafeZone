import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safezone/constant/app_colors.dart';

class RoundedTextField extends StatefulWidget {
  final Color? focusColor;
  final Function(String value) onChange;
  final String? Function(String?)? validator;
  final double? width;
  final bool? obscureText;
  final TextInputType? inputType;
  final String hintText;
  final double? size;
  final IconData icon;
  final IconData? suffixIcon;
  final Color? hintColor;
  final Color? textColor;
  final Color? backgroundColor;
  final bool? enableInput;

  const RoundedTextField({
    super.key,
    this.focusColor,
    required this.onChange,
    this.validator,
    this.width,
    this.obscureText = false,
    this.inputType,
    required this.hintText,
    this.size,
    required this.icon,
    this.suffixIcon,
    this.hintColor,
    this.textColor,
    this.backgroundColor,
    this.enableInput = true,
  });

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => widget.validator!(value),
      onChanged: (value) => widget.onChange(value),
      keyboardType: widget.inputType ?? TextInputType.text,
      obscureText: widget.obscureText! ? passwordVisible : widget.obscureText!,
      enabled: widget.enableInput,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: widget.hintColor ?? AppColor.lightGrey,
        ),
        suffixIcon: widget.obscureText!
            ? IconButton(
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                icon: passwordVisible
                    ? Icon(
                        FontAwesomeIcons.eye,
                        size: 14,
                        color: widget.hintColor ?? AppColor.lightGrey,
                      )
                    : Icon(
                        FontAwesomeIcons.eyeSlash,
                        size: 14,
                        color: widget.hintColor ?? AppColor.lightGrey,
                      ))
            : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: widget.hintColor ?? AppColor.lightGrey,
            fontSize: widget.size ?? 13),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 1, style: BorderStyle.solid, color: Colors.red),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(50),
        ),
        contentPadding: const EdgeInsets.all(10),
        isDense: true,
        filled: true,
        fillColor: widget.backgroundColor ?? AppColor.grey,
      ),
      style: TextStyle(
          color: widget.enableInput!
              ? (widget.textColor ?? AppColor.darkBlue)
              : AppColor.lightGrey,
          fontSize: widget.size ?? 13),
    );
  }
}
