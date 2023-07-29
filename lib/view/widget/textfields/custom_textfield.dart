import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ideal_promoter/constant/const_color.dart';

class CustomTextField extends StatefulWidget {
  final String? value;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final bool? isPassword;
  final void Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final void Function(String value)? onFieldSubmitted;
  final void Function()? onTap;
  final int? maxLength;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.validator,
    this.hintText,
    this.prefix,
    this.controller,
    this.isPassword,
    this.onChanged,
    this.keyboardType,
    this.padding,
    this.focusNode,
    this.onFieldSubmitted,
    this.suffix,
    this.value,
    this.onTap,
    this.maxLength,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void dispose() {
    if (widget.controller != null) widget.controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        controller: widget.controller,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          counterText: '',
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          prefixStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          fillColor: const Color(0xFFF2F2F2),
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Color(0xFF828282),
            letterSpacing: 0.08,
            fontWeight: FontWeight.w400,
          ),
        ),
        onChanged: widget.onChanged,
        obscureText: widget.isPassword ?? false,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTap: widget.onTap,
      ),
    );
  }
}
