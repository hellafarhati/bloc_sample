import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../models/UserModel.dart';

@immutable
abstract class UserState extends Equatable{}

  class UserLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  }


  class UserLoadedState extends UserState{
  final List<UserModel> users;

  UserLoadedState(this.users);
  @override
  List<Object?> get props => [users];

  }


class UserErrorLoadingState extends UserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}