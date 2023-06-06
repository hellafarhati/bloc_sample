
import 'package:bloc_sample/repos/user_respository.dart';
import 'package:bloc_sample/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //RepositoryProvider make the api call
      home: SplashScreen() ,
      //states will be provided to the child home

    );
  }
}
