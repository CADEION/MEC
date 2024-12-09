import 'package:mec_frontend/data/models/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {
  
}

class UserLoadingState extends UserState {
  
}

class UserLoggedState extends UserState {
  final UserModel userModel;

  UserLoggedState({required this.userModel});

}

class UserLoggedOutState {
  
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState({required this.message});

}