
import 'package:courses_app/api/api_links.dart';
import 'package:courses_app/api/api_requests.dart';
import 'package:flutter/material.dart';

// page for testing the respond after doing two queries in backend
Future getData()async{
  ApiRequest request=ApiRequest();
  var response=await request.postRequest(linkViewWishlist,
      {
        "id":"1"
      }
  );
  if(response['status']=='success')
  {

    print(response['data']);
    print("===============");
    print(response['data'][1]['id']);
    return response ;
  }
  else
  {

    return "fail" ;
  }

}
class Tsst extends StatelessWidget {
  const Tsst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MaterialButton(onPressed: ()async{
       var dataa= await getData();

      },child: Text("press"),),

    );
  }
}
