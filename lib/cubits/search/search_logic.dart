
import 'package:courses_app/controller/search_controller.dart';
import 'package:courses_app/cubits/search/search_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit():super(SearchInitial());

  var response;
  var responsecourses;
  static SearchCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  //get course categories from controller
  Future<void> getData()async {
    emit(SearchLoading());
    response =await SearchController().getData();
    if(response['status']=="success"){
      emit(SearchSuccess());
    }
    else
    {
      emit(SearchFailure());
    }


  }

  //get courses from controller
  Future<void> getCourses()async {
    emit(SearchLoading());
    responsecourses =await SearchController().getCourses();
    print(responsecourses);
    if(responsecourses['status']=="success"){
      emit(SearchSuccess());
    }
    else
    {
      emit(SearchFailure());
    }


  }
}