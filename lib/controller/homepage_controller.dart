import 'package:courses_app/api/api_links.dart';
import 'package:courses_app/api/api_requests.dart';
import 'package:courses_app/model/homepage_model.dart';

class HomePageController{
  HomePageModel? homePageModel;
  Future getData()async{
    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linkViewCourses,
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

  Future getCourseCreatorInfo()async{
    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linkCreatorInfo,
        {
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