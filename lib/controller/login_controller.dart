import 'package:courses_app/api/api_links.dart';
import 'package:courses_app/api/api_requests.dart';
import 'package:courses_app/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class LoginController{
 UserModel? userModel;

  Future searchUser({required String email,required String password}) async{


    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linklogin,
      {
        "email": email,
        "password":password
      }
  );

    if(response['status']=='success')
      {
        userModel=UserModel.fromJson(response['data']);
        print("${userModel!.email}");
        return "success" ;

      }
    else
      {
        print("not dawly");
        return "fail" ;
      }


  }




}