
import 'package:courses_app/controller/login_controller.dart';
import 'package:courses_app/cubits/login/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());

  static LoginCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  Future<void> checkLoginState({required String email, required String password})async {
    emit(LoginLoading());

    if(await LoginController().searchUser(email: email,password: password)=="success"){
      emit(LoginSuccess());
    }
    else
    {
        emit(LoginFailure());
    }


  }
}