
import 'package:courses_app/api/api_links.dart';
import 'package:courses_app/api/api_requests.dart';
import 'package:courses_app/controller/coursedetails_controller.dart';
import 'package:courses_app/cubits/coursedetails/coursedetails_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState>{
   var  response;
   var response2;
  CourseDetailsCubit():super(CourseDetailsInitial());
  static CourseDetailsCubit getObj(BuildContext context) {
    return BlocProvider.of(context);
  }


    Future checkCourseDetailsState({required var courseId,required var videoCreatorId}) async {
      print("checking");
      emit(CourseDetailsLoading());
      response2= await CourseDetailsController().getCourseCreatorInfo(userId: videoCreatorId, courseId: courseId);
      response= await CourseDetailsController().getData(courseId: courseId);
      if(response['status']!="fail")
        {
          print("stage 1");
          emit(CourseDetailsSuccess());
          /*
          if(response2['status']!="fail")
            {
              print(response2);
              print("stage 2");
              emit(CourseDetailsSuccess());
            }
          else
            {
              print(response);
              emit(CourseDetailsFailure());
            }

           */

        }
      else
        {
          print(response);
          emit(CourseDetailsFailure());
        }
        }

        Future getCourseDetails({required var userId, required var courseId})async
        {
          print("checking");
          emit(CourseDetailsLoading());
          ApiRequest request=ApiRequest();
          response=await request.postRequest(linkViewCourseDetails,
              {
                "userid" : userId,
                "courseid" : courseId
              }
          );
          if(response['status']=='success')
          {

            print(response['data']);
            emit(CourseDetailsSuccess());

          }
          else
          {
            emit(CourseDetailsFailure());
          }
        }


  }



