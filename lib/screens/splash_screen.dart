

import 'package:bloc_sample/main.dart';
import 'package:bloc_sample/repos/user_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome()  async{
    await Future.delayed(Duration(milliseconds: 1500), (){});


    Navigator.pushReplacement(context ,
      MaterialPageRoute(
        builder: (BuildContext context) => RepositoryProvider(
          create: (context) => UserRepository(),
          child:   MyHomePage(),
        ),
      ),
    );
   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/bilog.jpeg'),
              Text("Bilog"),

            ],
          ) 
        ),
      ),

    );
  }
}


