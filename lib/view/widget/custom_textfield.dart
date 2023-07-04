import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool? isPasword;
  final void Function(String value)? onChanged;
  final TextInputType? keyboardType;

  const CustomTextField(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.controller,
      this.isPasword,
      this.onChanged,
      this.keyboardType});

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
    return TextFormField(
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
      ),
      onChanged: widget.onChanged,
      obscureText: widget.isPasword ?? false,
      keyboardType: widget.keyboardType,
    );
  }
}
