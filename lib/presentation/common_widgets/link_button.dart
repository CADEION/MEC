import 'package:flutter/material.dart';

import '../../core/ui.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({super.key, required this.onPressed, required this.buttonText});
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
                    onPressed: onPressed,
                    child:
                        Text(buttonText, style: MyTextStyles.heading3));
  }
}