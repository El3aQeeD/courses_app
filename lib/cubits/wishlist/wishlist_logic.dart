
import 'package:courses_app/controller/login_controller.dart';
import 'package:courses_app/controller/wishlist_controller.dart';
import 'package:courses_app/cubits/login/login_state.dart';
import 'package:courses_app/cubits/wishlist/wishlist_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListCubit extends Cubit<WishListState>{
  Map? response;
  bool wishlistEmpty= false;
  WishListCubit():super(WishListInitial());

  static WishListCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }



    Future checkCourseDetailsState({required var userId}) async {
      print("checking");
      emit(WishListLoading());
      response= await WishListController().getData(userId: userId);

      if(response!['status']!="fail")
      {
        print(response);
        wishlistEmpty=false;
        emit(WishListSuccess());
      }
      else
      {
        print(response);
        emit(WishListFailure());
      }
    }

    deleteWishListRow(int index)
    {
      response!['data'].removeAt(index);
      if(response!['data'].isEmpty)
        {
          wishlistEmpty=true;
        }
      else
        {
          wishlistEmpty = false;

        }

      emit(WishListDeleteData());
    }





}