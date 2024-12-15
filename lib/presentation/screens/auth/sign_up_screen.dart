import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mec_frontend/presentation/screens/auth/providers/signup_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common_widgets/gap_widget.dart';
import '../../common_widgets/link_button.dart';
import '../../common_widgets/primary_button.dart';
import '../../common_widgets/primary_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String routeName = 'SignUp';
  @override
  Widget build(BuildContext context) {

    final signupProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: 'Log In'.text.make(),
        centerTitle: true,
      ),
      body: Form(
        key: signupProvider.formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: ListView(
              children: [
                (signupProvider.error == ""
                    ? SizedBox()
                    : Text(signupProvider.error)),
                const GapWidget(),
                PrimaryTextField(
                  labelText: 'Email',
                  textEditingController: signupProvider.emailController,
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
                  textEditingController: signupProvider.passwordController,
                  textInputType: TextInputType.text,
                  validators: (value) {
                    if (value == null || value.trim() == '') {
                      return 'Password is Required';
                    }
                    return null;
                  },
                ),
                const GapWidget(),
                PrimaryTextField(
                  labelText: 'Password',
                  textEditingController: signupProvider.cPasswordController,
                  textInputType: TextInputType.text,
                  validators: (value) {
                    if (value == null || value.trim() == '') {
                      return 'Confirm Your Password ';
                    }
                    else if( value.trim() != signupProvider.passwordController.text.trim() ){
                      return 'Password is not Matched';
                    }
                    return null;
                  },
                ),
                const GapWidget(),
                PrimaryButton(
                    buttonText: (signupProvider.isLoading) ? '...' : 'Log In',
                    onPressed: signupProvider.signUp),
                const GapWidget(),
                LinkButton(onPressed: () {}, buttonText: "Want to signup !"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}