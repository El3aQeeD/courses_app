



import 'package:courses_app/api/api_links.dart';
import 'package:courses_app/api/api_requests.dart';

class WishListController{
  Future getData({required var userId})async{
    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linkViewWishlist,
        {
          "id" : userId
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

  Future deleteData({required dataId}) async
  {
    ApiRequest request=ApiRequest();
    var response=await request.postRequest(linkDeleteWishlist,
        {
          "id" : dataId
        }
    );

    if(response['status']=='success')
    {

      print("deleted");

      return "success" ;
    }
    else
    {
      print("not deleted");

      return "fail" ;
    }
  }



}