import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mec_frontend/data/models/user_model.dart';
import 'package:mec_frontend/data/repositories/user_repository.dart';
import 'package:mec_frontend/logic/cubit/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  UserRepository userRepository = UserRepository();

  void signIn({required String email, required String password}) async {
    try {
      UserModel userData = await userRepository.signIn(email: email ,password: password);
      emit(UserLoggedState(userModel: userData));
    } catch (err) {
      emit(UserErrorState(message: err.toString()));
    }
  }

  void createAccount({required String email, required String password}) async {
    try {
      UserModel userData = await userRepository.createAccount(email: email ,password: password);
      emit(UserLoggedState(userModel: userData));
    } catch (err) {
      emit(UserErrorState(message: err.toString()));
    }
  }
}
