import 'package:bloc_sample/blocs/app_events.dart';
import 'package:bloc_sample/blocs/app_states.dart';
import 'package:bloc_sample/blocs/user_bloc.dart';
import 'package:bloc_sample/repos/user_respository.dart';
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
      home: RepositoryProvider(create:(context) => UserRepository(),
      //states will be provided to the child home
      child: MyHomePage(),)
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
   return BlocProvider(create: (context) => UserBloc(
     RepositoryProvider.of<UserRepository>(context),)..add(LoadUserEvent()),
     child: Scaffold(
     appBar: AppBar(
         title: Text("Bloc Sample Apll"),
     ),
       body: BlocBuilder<UserBloc,UserState>(
         builder: (context,state) {
           if(state is UserLoadingState){
             return const Center(
               child:
               CircularProgressIndicator(),
             );
           }
           return Container();
         },
       ),
   ));
  }
}
