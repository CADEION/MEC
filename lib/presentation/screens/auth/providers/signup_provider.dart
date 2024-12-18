import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mec_frontend/logic/cubit/user_cubit/user_cubit.dart';

import '../../../../logic/cubit/user_cubit/user_state.dart';

class SignupProvider with ChangeNotifier {
  final BuildContext context;

  SignupProvider(this.context) {
    _listenToCubit();
  }

  bool isLoading = false;
  String error = '';
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();
  StreamSubscription? _userSubscription;

  void _listenToCubit() {
    log('Listening to userCubit state');
    _userSubscription =
        BlocProvider.of<UserCubit>(context).stream.listen((userState) {
      if (userState is UserLoadingState) {
        isLoading = true;
        error = '';
        notifyListeners();
      } else if (userState is UserErrorState) {
        isLoading = false;
        error = userState.message;
        notifyListeners();
      } else {
        isLoading = false;
        error = '';
        notifyListeners();
      }
    });
  }

  void signUp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    BlocProvider.of<UserCubit>(context)
        .createAccount(email: email, password: password);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
    _userSubscription?.cancel();
    super.dispose();
  }
}
