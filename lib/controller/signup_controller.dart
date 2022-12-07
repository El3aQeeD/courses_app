import 'package:courses_app/api/api_links.dart';
import 'package:courses_app/api/api_requests.dart';
import 'package:courses_app/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class SignupController{

  Future searchUser({required String email,required String password,required String name}) async{


    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linksignup,
        {
          "email": email,
          "password":password,
          "username":name
        }
    );

    if(response['status']=='success')
    {
      print(" dawly");
      return "success" ;
    }
    else
    {
      print("not dawly");
      return "fail" ;
    }


  }




}