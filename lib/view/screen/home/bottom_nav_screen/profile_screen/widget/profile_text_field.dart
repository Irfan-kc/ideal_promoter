import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';

import '../../../../../../constant/text_style.dart';

class ProfileTextField extends StatefulWidget {
  final String? labelText;
  final void Function(String value)? onChanged;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final void Function(String value)? onFieldSubmitted;
  final bool? readOnly;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final String? Function(String?)? validator;
  const ProfileTextField({
    super.key,
    this.labelText,
    this.onChanged,
    this.focusNode,
    this.padding,
    this.keyboardType,
    this.onFieldSubmitted,
    this.readOnly,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.maxLength,
  });

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColors.textSecondary),
          ),
          const KHeight(5),
          TextFormField(
            validator: widget.validator,
            maxLength: widget.maxLength,
            readOnly: widget.readOnly ?? false,
            controller: widget.controller,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            style: AppTextStyle.textFieldText,
            decoration: InputDecoration(
              counter: const SizedBox(),
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: Color(0xFFCCCCCC), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: Color(0xFFCCCCCC), width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
