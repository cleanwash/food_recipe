import 'package:flutter/material.dart';
import 'package:food_recipe/ui/color_styles.dart';
import 'package:food_recipe/ui/text_styles.dart';


class BigButton extends StatefulWidget {
  final String label;
  const BigButton({super.key, required this.label});
  
  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 18),
        backgroundColor: ColorStyles.primary100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.label,
              style: TextStyles.normalTextBold.copyWith(
                color: isPressed ? ColorStyles.warning : ColorStyles.white,
              )),
          SizedBox(width: 20), 
          const Icon(
            Icons.arrow_forward,
            color: ColorStyles.white,
            size: 20,
          )
        ],
      ),
    );
  }
}