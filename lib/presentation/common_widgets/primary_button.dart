import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/ui.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.buttonColor = Colors.blueAccent});
  final String buttonText;
  final VoidCallback onPressed;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            minimumSize: Size(MediaQuery.of(context).size.width, 50),
            elevation: 5),
        onPressed: onPressed,
        child: Text(buttonText,
            style: MyTextStyles.heading2.copyWith(
              color: MyColors.white,
            )));
  }
}
