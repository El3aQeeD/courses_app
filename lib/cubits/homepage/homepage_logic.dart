import 'package:courses_app/controller/homepage_controller.dart';
import 'package:courses_app/cubits/homepage/homepage_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageState> {
  var response;
  var response2;
  HomePageCubit() :super(HomePageInitial());
  static HomePageCubit getObj(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> checkHomePageState() async {
    emit(HomePageLoading());
   response= await HomePageController().getData();
    if(response['status']!="fail")
      {
        response2=await HomePageController().getCourseCreatorInfo();
        if(response2['status']!="fail")
          {
            emit(HomePageSuccess());
          }
        else
          {
            emit(HomePageFailure());
          }



      }
    else
      {

        emit(HomePageFailure());
      }
  }
}