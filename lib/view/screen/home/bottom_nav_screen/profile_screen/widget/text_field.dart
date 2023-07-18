import 'package:flutter/material.dart';

import '../../../../../../constant/text_style.dart';
import '../../../../../widget/height_and_width.dart';

class ProfileTextField extends StatefulWidget {
  final String value;
  final String? labelText;
  final void Function(String value)? onChanged;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final void Function(String value)? onFieldSubmitted;
  final bool? readOnly;
  const ProfileTextField(
      {super.key,
      required this.value,
      this.labelText,
      this.onChanged,
      this.focusNode,
      this.padding,
      this.keyboardType,
      this.onFieldSubmitted,
      this.readOnly});

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  late final FocusNode focusNode;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.value;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (controller.text != widget.value) {
        controller.text = widget.value.toString();
      }
    });
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Color(0xFF9E9E9E)),
          ),
          const KHeight(5),
          TextFormField(
            readOnly: widget.readOnly ?? false,
            controller: controller,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            style: AppTextStyle.textFieldText,
            decoration: InputDecoration(
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
