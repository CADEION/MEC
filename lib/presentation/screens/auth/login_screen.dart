import 'package:flutter/material.dart';
import 'package:mec_frontend/presentation/common_widgets/gap_widget.dart';
import 'package:mec_frontend/presentation/common_widgets/link_button.dart';
import 'package:mec_frontend/presentation/common_widgets/primary_button.dart';
import 'package:mec_frontend/presentation/common_widgets/primary_text_field.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = 'Login';

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: 'Log In'.text.make(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        child: Column(
          children: [
            GapWidget(),
            PrimaryTextField(
              labelText: 'Email',
              textEditingController: controller,
              textInputType: TextInputType.emailAddress,
            ),
            GapWidget(),
            PrimaryTextField(
              labelText: 'Password',
              textEditingController: controller,
              textInputType: TextInputType.text,
            ),
            GapWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LinkButton(onPressed: () {}, buttonText: 'Forgot Password')
              ],
            ),
            GapWidget(),
            PrimaryButton(buttonText: 'Log In', onPressed: (){}),
            GapWidget(),
            LinkButton(onPressed: (){}, buttonText: "Want to signup !" ),
            
            ],
        ),
      ),
    );
  }
}
