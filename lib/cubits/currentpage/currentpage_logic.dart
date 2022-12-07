
import 'package:flutter/material.dart';
import 'package:courses_app/cubits/currentpage/currentpage_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentPageCubit extends Cubit<CurrentPageState>{
  CurrentPageCubit():super(CurrentPageInitial());

  static CurrentPageCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  int index=0;
  Color colorhome= Colors.white;
  Color colorseach= Colors.black;
  Color colormylearning= Colors.black;
  Color colorwishlist= Colors.black;
  Color coloraccount = Colors.black;

  home()
  {
    index=0;
    colorhome= Colors.white;
     colorseach= Colors.black;
     colormylearning= Colors.black;
     colorwishlist= Colors.black;
     coloraccount = Colors.black;

    emit(CurrentPageHome());
  }
  search()
  {
    index=1;
    colorhome= Colors.black;
    colorseach= Colors.white;
    colormylearning= Colors.black;
    colorwishlist= Colors.black;
    coloraccount = Colors.black;

    emit(CurrentPageSearch());

  }
  myLearning()
  {
    index=2;
    colorhome= Colors.black;
    colorseach= Colors.black;
    colormylearning= Colors.white;
    colorwishlist= Colors.black;
    coloraccount = Colors.black;

    emit(CurrentPageMylearning());
  }
  wishList()
  {
    index=3;
    colorhome= Colors.black;
    colorseach= Colors.black;
    colormylearning= Colors.black;
    colorwishlist= Colors.white;
    coloraccount = Colors.black;
    emit(CurrentPageWishlist());
  }
  account()
  {
    index=4;
    colorhome= Colors.black;
    colorseach= Colors.black;
    colormylearning= Colors.black;
    colorwishlist= Colors.black;
    coloraccount = Colors.white;
    emit(CurrentPageAccount());

  }


}