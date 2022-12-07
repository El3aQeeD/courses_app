

import 'package:courses_app/cubits/bottomNavigtionBar/bottomNavigationBar_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState>{
  BottomNavigationBarCubit():super(BNBInitial());

  static BottomNavigationBarCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  Future<void> checkBNBState({required int BNBindex})async {


  }
}