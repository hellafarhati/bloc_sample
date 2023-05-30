import 'dart:convert';

import 'package:bloc_sample/models/UserModel.dart';
import 'package:http/http.dart';

class UserRepository{

  final endPoint = "https://reqres.in/api/users?page=2";

  Future <List<UserModel>> getAllUsers() async {

     Response response = await  get(Uri.parse(endPoint));
     if(response.statusCode == 200){

       final List  result = jsonDecode(response.body)['data'] ;
       return   result.map((e) => UserModel.fromJson(e)).toList();

     } else {
       throw Exception(response.reasonPhrase);
     }






  }





}