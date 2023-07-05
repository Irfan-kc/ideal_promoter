import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool? isPassword;
  final void Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final void Function(String value)? onFieldSubmitted;

  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.isPassword,
    this.onChanged,
    this.keyboardType,
    this.padding,
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: TextFormField(
        controller: _textEditingController,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.prefixIcon),
            prefixIconColor: const Color(0XFF828282),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            fillColor: const Color(0xFFF2F2F2),
            filled: true,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFF828282),
                letterSpacing: 0.08,
                fontWeight: FontWeight.w400)),
        onChanged: widget.onChanged,
        obscureText: widget.isPassword ?? false,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
