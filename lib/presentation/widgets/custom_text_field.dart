import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? title;
  final bool obscureText;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final bool readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool isRequired;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLines;
  final double padding;
  final TextInputType? keyboardType;
  final bool onlyText;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  const CustomTextField({
    Key? key,
    this.controller,
    this.titleStyle,
    this.onFieldSubmitted,
    this.onTap,
    this.validator,
    this.onChanged,
    this.readOnly = false,
    this.initialValue,
    this.obscureText = false,
    this.autovalidateMode,
    this.keyboardType,
    this.padding = 0,
    this.isRequired = false,
    this.title,
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength,
    this.hintStyle,
    this.suffix,
    this.prefix,
    this.hintText,
    this.onlyText = false,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Row(
            children: [
              Text(
                title!,
                style: titleStyle ??
                    GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 16),
              ),
              if (isRequired)
                const Icon(
                  CupertinoIcons.staroflife_fill,
                  color: Colors.red,
                  size: 8,
                )
            ],
          ),
        TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          initialValue: initialValue,
          controller: controller,
          autovalidateMode: autovalidateMode,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          onChanged: onChanged,
          keyboardType: keyboardType,
          onFieldSubmitted: onFieldSubmitted,
          onEditingComplete: onEditingComplete,
          maxLines: maxLines,
          obscureText: obscureText,
          enabled: !onlyText,
          validator: validator,
          style: hintStyle ??
              GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 14),
          decoration: InputDecoration(
            counterText: "",
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hintText: hintText,
            hintStyle: hintStyle ??
                GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500, fontSize: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
