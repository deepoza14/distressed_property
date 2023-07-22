import 'package:distressed_property/theme/textstyle.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 366,
      height: 62,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xffd9d9d9)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        child: Text(
          text,
          style: editTextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Color(0xFF5F5F5F)),
        ),
      ),
    );
  }
}
