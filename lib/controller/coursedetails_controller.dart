



import 'package:courses_app/api/api_links.dart';
import 'package:courses_app/api/api_requests.dart';

class CourseDetailsController{
  //get course videos
  Future getData({required var courseId})async{
    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linkViewCourseVideos,
        {
          "course_id" : courseId
        }
    );
    if(response['status']=='success')
    {
      print("geeet");
      print(response['data']);
      return response ;
    }
    else
    {
      return response ;
    }

  }

  Future addToWishList({required var courseId,required var userId})async{
    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linkAddWishlist,
        {
          "courseId" : courseId,
          "userId" : userId,

        }
    );
    if(response['status']=='success')
    {

      print(response['data']);
      return response ;
    }
    else
    {

      return response ;
    }

  }

  Future getCourseCreatorInfo({required var userId,required var courseId})async{
    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linkCreatorInfo,
        {
          "courseId" : courseId,
          "id":userId

        }
    );
    if(response['status']=='success')
    {
      print("creator");
      print(response['data']);
      return response ;
    }
    else
    {

      return response ;
    }

  }

  Future buyCourse({required var courseId,required var userId,required double price})async{
    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linkAddWishlist,
        {
          "courseId" : courseId,
          "userId" : userId,
          "price":price

        }
    );
    if(response['status']=='success')
    {


      return response ;
    }
    else
    {

      return response ;
    }

  }


}