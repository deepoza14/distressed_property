import 'package:distressed_property/theme/textstyle.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color; // New required color property
  final Color textColor; // New required textColor property

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color, // Marking it as required
    required this.textColor, // Marking it as required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 366,
      height: 62,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(textColor),
          // Use the provided textColor
          backgroundColor: MaterialStateProperty.all<Color>(color),
          // Use the provided color
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        child: Text(
          text,
          style: // Merge the provided textStyle with the default style
              editTextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: textColor, // Use the provided textColor
          ),
        ),
      ),
    );
  }
}
