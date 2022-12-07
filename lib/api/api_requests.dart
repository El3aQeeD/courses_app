import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiRequest{
  getRequest(String url)async{
    await Future.delayed(Duration(seconds: 1));
    var response= await http.get(Uri.parse(url)) ;
    if(response.statusCode==200)
    {
      var body=jsonDecode(response.body);
      return body ;
    }
    else
    {
      print("error ${response.statusCode}");
    }
  }

  postRequest(String url,Map data)async{
    await Future.delayed(Duration(milliseconds: 600));
    var response= await http.post(Uri.parse(url),body: data) ;
    if(response.statusCode==200)
    {
      var body=jsonDecode(response.body);

      return body ;
    }
    else
    {
      print("error in crud==========");
      print("error ${response.statusCode}");
    }
  }
}