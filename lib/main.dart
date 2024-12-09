import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mec_frontend/core/routes.dart';
import 'package:mec_frontend/core/ui.dart';
import 'package:mec_frontend/logic/cubit/user_cubit/user_cubit.dart';
import 'package:mec_frontend/presentation/screens/auth/login_screen.dart';


void main() {
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

