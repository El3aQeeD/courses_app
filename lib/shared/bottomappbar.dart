import 'package:courses_app/view/search_view.dart';
import 'package:courses_app/view/wishlist_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget bottomAppBar(BuildContext context)
{
  return BottomAppBar(

    notchMargin: 2 ,
    shape: CircularNotchedRectangle(),
    color: Color(0xFF7558f0).withOpacity(.9),
    child: Row(
      children: [
        MaterialButton(onPressed: (){},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home_filled,color: Colors.white,),
              Text("Home",style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        MaterialButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Search()));
        },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search,color: Colors.black,),
              Text("Search",style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
        Spacer(),
        MaterialButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WishList()));
        },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite_border,color: Colors.black,),
              Text("Wishlist",style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
        MaterialButton(onPressed: (){

        },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.account_circle_outlined,color: Colors.black,),
              Text("Account",style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
      ],

    ),

  );
}