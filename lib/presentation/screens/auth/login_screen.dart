import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mec_frontend/presentation/common_widgets/gap_widget.dart';
import 'package:mec_frontend/presentation/common_widgets/link_button.dart';
import 'package:mec_frontend/presentation/common_widgets/primary_button.dart';
import 'package:mec_frontend/presentation/common_widgets/primary_text_field.dart';
import 'package:mec_frontend/presentation/screens/auth/providers/login_provider.dart';
import 'package:mec_frontend/presentation/screens/auth/sign_up_screen.dart';
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
      body: Form(
        key: loginProvider.formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: ListView(
              children: [
                (loginProvider.error == ""
                    ? SizedBox()
                    : Text(loginProvider.error)),
                const GapWidget(),
                PrimaryTextField(
                  labelText: 'Email',
                  textEditingController: loginProvider.emailController,
                  textInputType: TextInputType.emailAddress,
                  validators: (value) {
                    if (value == null || value.trim() == '') {
                      return 'Email is Required';
                    } else if (!EmailValidator.validate(value.trim())) {
                      return 'Email is Inavlid';
                    }
                    return null;
                  },
                ),
                const GapWidget(),
                PrimaryTextField(
                  labelText: 'Password',
                  textEditingController: loginProvider.passwordController,
                  textInputType: TextInputType.text,
                  validators: (value) {
                    if (value == null || value.trim() == '') {
                      return 'Password is Required';
                    }
                    return null;
                  },
                ),
                const GapWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LinkButton(onPressed: () {}, buttonText: 'Forgot Password')
                  ],
                ),
                const GapWidget(),
                PrimaryButton(
                    buttonText: (loginProvider.isLoading) ? '...' : 'Log In',
                    onPressed: loginProvider.logIn),
                const GapWidget(),
                LinkButton(onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                }, buttonText: "Want to signup !"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
