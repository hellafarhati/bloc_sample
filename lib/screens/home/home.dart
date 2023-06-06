import 'package:flutter/material.dart';
import 'package:bloc_sample/blocs/app_events.dart';
import 'package:bloc_sample/blocs/app_states.dart';
import 'package:bloc_sample/blocs/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_sample/repos/user_respository.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserBloc(
              RepositoryProvider.of<UserRepository>(context),
            )..add(LoadUserEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Bloc Sample Apll"),
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserLoadedState) {
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: state.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.amber[100],
                        child:  ListTile(

                          leading: CircleAvatar( child: Image.network(state.users[index].avatar!!)),
                          title: Text(state.users[index].firstName!!),
                        ),
                      );
                    });
              } else if (state is UserErrorLoadingState) {
                return const Center(
                  child: Text("error occured"),
                );
              }
              return Container();
            },
          ),
        ));
  }
}
