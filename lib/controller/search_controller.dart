

import 'package:courses_app/api/api_links.dart';
import 'package:courses_app/api/api_requests.dart';

class SearchController
{

  //get categories of courses
  Future getData() async{

    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linkViewCourseType,
        {}
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
  // get course names
  Future getCourses() async{

    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linkViewCourses,
        {}
    );

    if(response['status']=='success')
    {
      print("good");
      return response ;

    }
    else
    {
      print("not good");
      return response ;
    }


  }
}