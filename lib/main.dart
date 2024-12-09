import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mec_frontend/core/routes.dart';
import 'package:mec_frontend/core/ui.dart';
import 'package:mec_frontend/logic/cubit/user_cubit/user_cubit.dart';
import 'package:mec_frontend/presentation/screens/auth/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
      ],
      child: MaterialApp(
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: LoginScreen.routeName,
        theme: Themes.defaultTheme,
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  
  @override
  void onCreate(BlocBase bloc) {
    log('Created : ${bloc}');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('Created : ${change}');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    log('Created : ${bloc}');
    super.onClose(bloc);
  }


  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('Created : ${bloc} : ${transition}');
    super.onTransition(bloc, transition);
  }
}

