import 'package:flutter/material.dart';
import 'package:mec_frontend/presentation/common_widgets/gap_widget.dart';
import 'package:mec_frontend/presentation/common_widgets/link_button.dart';
import 'package:mec_frontend/presentation/common_widgets/primary_button.dart';
import 'package:mec_frontend/presentation/common_widgets/primary_text_field.dart';
import 'package:mec_frontend/presentation/screens/auth/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = 'Login';

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: 'Log In'.text.make(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        child: Column(
          children: [

            (loginProvider.error == "" ? SizedBox() : Text(loginProvider.error)),

            const GapWidget(),
            PrimaryTextField(
              labelText: 'Email',
              textEditingController: loginProvider.emailController,
              textInputType: TextInputType.emailAddress,
            ),
            const GapWidget(),
            PrimaryTextField(
              labelText: 'Password',
              textEditingController: loginProvider.passwordController,
              textInputType: TextInputType.text,
            ),
            const GapWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LinkButton(onPressed: () {}, buttonText: 'Forgot Password')
              ],
            ),
            const GapWidget(),
            PrimaryButton(buttonText:(loginProvider.isLoading) ? '...' : 'Log In', onPressed: loginProvider.logIn),
            const GapWidget(),
            LinkButton(onPressed: () {}, buttonText: "Want to signup !"),
          ],
        ),
      ),
    );
  }
}
