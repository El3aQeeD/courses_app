import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget appBar(String userName)
{
  return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30)),
        gradient:LinearGradient(
          colors: [
            Color(0xff886ff2),
            Color(0xff6849ef),
            //add more colors for gradient
          ],
          begin: Alignment.topLeft, //begin of the gradient color
          end: Alignment.topRight, //end of the gradient color
        ),
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              DateTime.now().hour < 17 ? Text("Hello, $userName \n Good Morning",style: TextStyle(color: Colors.white,fontSize: 26),) :
              Text("Hello, $userName \n Good Evening",style: TextStyle(color: Colors.white,fontSize: 26),),
              SizedBox(width: 140,),
              CircleAvatar(maxRadius: 30,backgroundColor: Colors.grey, child: Icon(Icons.face,color: Colors.white,size: 30,),)
            ],
          )
        ],
      )
  );
}