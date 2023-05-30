import 'package:bloc/bloc.dart';
import 'package:bloc_sample/blocs/app_events.dart';
import 'package:bloc_sample/blocs/app_states.dart';
import '../repos/user_respository.dart';

class UserBloc extends Bloc<UserEvent , UserState>{
  //bloc library takes two parameters an event and a state
  final UserRepository _userRepository;


  UserBloc(this._userRepository) :
      //should have a constructor and the constructor should have an initial value so we pass loading
        super(UserLoadingState()){
    on<LoadUserEvent>((event, emit) async{
      //from ui we call  this event which will emit the new state
      emit (UserLoadingState());
      try{
        final users = await _userRepository.getAllUsers();
        emit(UserLoadedState(users));


      }catch(e){
        emit(UserErrorLoadingState(e.toString()));
      }


    });
  }
}