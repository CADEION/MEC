import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/ui.dart';

class PrimaryTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validators;
  final TextInputType textInputType;

  PrimaryTextField({
    super.key,
    required this.labelText,
    required this.textEditingController,
    this.validators,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return VxTextField(
      borderRadius: 10,
      borderColor: MyColors.accent,
      borderType: VxTextFieldBorderType.roundLine,
      labelText: labelText,
      controller: textEditingController,
      keyboardType: textInputType,
      validator: validators,
    );
  }
}
