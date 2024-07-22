import 'package:flutter/material.dart';
import 'package:food_recipe/ui/color_styles.dart';
import 'package:food_recipe/ui/text_styles.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final void Function(String)? onChanged;

  const InputField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText,
            style: TextStyles.smallTextRegular.copyWith(
              color: ColorStyles.black,
            )),
        TextField(
          obscureText: obscureText,
          onChanged: onChanged, // 여기에 onChanged 콜백 추가
          decoration: InputDecoration(
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorStyles.gray4),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorStyles.primary100),
              borderRadius: BorderRadius.circular(12.0),
            ),
            hintStyle: TextStyle(
              fontSize: TextStyles.smallerTextRegular.fontSize,
              color: ColorStyles.gray4,
            ),
          ),
        ),
      ],
    );
  }
}
