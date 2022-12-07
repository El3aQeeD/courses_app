
import 'package:courses_app/controller/signup_controller.dart';
import 'package:courses_app/cubits/signup/signup_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState>{
  SignupCubit():super(SignupInitial());

  static SignupCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  Future<void> checkSignupState({required String email, required String password,required String name})async {
    emit(SignupLoading());

    if(await SignupController().searchUser(email: email,password: password, name: name)=="success"){
      emit(SignupSuccess());
    }
    else
    {
      emit(SignupFailure());
    }




  }


}