import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldWidget extends StatefulWidget {
  final String text;
  final bool isPassword;
  final bool isNumber;
  final TextEditingController controller;

  const TextFieldWidget({
    super.key,
    required this.text,
    this.isPassword = false,
    this.isNumber = false,
    required this.controller,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureText = true;

  // Telefon raqami uchun maska (Formater)
  final maskFormatter = MaskTextInputFormatter(
    mask: '+998 ## ### ## ##',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      // Agar isNumber true bo'lsa, maskani ishlatamiz
      inputFormatters: widget.isNumber ? [maskFormatter] : [],

      // Agar isPassword true bo'lsa va _obscureText true bo'lsa, matnni yashiramiz
      obscureText: widget.isPassword ? _obscureText : false,

      // Klaviatura turi
      keyboardType: widget.isNumber ? TextInputType.phone : TextInputType.text,

      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        filled: true,
        fillColor: Colors.white,
        hintText: widget.isNumber ? widget.text : widget.text,
        hintStyle: TextStyle(color: Colors.black45, fontSize: 14.sp),

        // SuffixIcon qismi
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: Colors.grey,
            size: 22.sp,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,

        // Chegaralar (Borders)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Colors.white, width: 1.5),
        ),
      ),
    );
  }
}