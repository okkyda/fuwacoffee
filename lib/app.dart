import 'package:coffee_app/blocs/Authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
 // Pastikan path sesuai

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: MaterialApp(
        home: Scaffold(
          body: Center(child: Text("Hello World")),
        ),
      ),
    );
  }
}
