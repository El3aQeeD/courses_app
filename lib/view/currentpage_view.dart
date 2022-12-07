import 'package:courses_app/cubits/currentpage/currentpage_logic.dart';
import 'package:courses_app/cubits/currentpage/currentpage_state.dart';
import 'package:courses_app/shared/bottomappbar.dart';
import 'package:courses_app/view/homepage_view.dart';
import 'package:courses_app/view/mylearning_view.dart';
import 'package:courses_app/view/search_view.dart';
import 'package:courses_app/view/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CurrentPage extends StatelessWidget {
  List screen=[
    Home(),
    Search(),
    MyLearning(),
    WishList(),
  ];



  @override
  Widget build(BuildContext context) {
    var obj=CurrentPageCubit.getObj(context);
    return BlocConsumer<CurrentPageCubit,CurrentPageState>(listener:(context,state){},
        builder: (context,state){
      return  Scaffold(
        floatingActionButton: FloatingActionButton(backgroundColor: Color(0xFF7558f0).withOpacity(.9) ,onPressed: (){
          obj.myLearning();
          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyLearning()));
        },child:  Icon(Icons.play_circle_outline_outlined,color: obj.colormylearning,size: 35,),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(

          notchMargin: 2 ,
          shape: CircularNotchedRectangle(),
          color: Color(0xFF7558f0).withOpacity(.9),
          child: Row(
            children: [
              MaterialButton(onPressed: (){
                obj.home();
              },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home_filled,color: obj.colorhome,),
                    Text("Home",style: TextStyle(color: obj.colorhome)),
                  ],
                ),
              ),
              MaterialButton(onPressed: (){
                obj.search();
                //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Search()));
              },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search,color: obj.colorseach,),
                    Text("Search",style: TextStyle(color: obj.colorseach),),
                  ],
                ),
              ),
              Spacer(),
              MaterialButton(onPressed: (){
                obj.wishList();
                //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WishList()));
              },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite_border,color: obj.colorwishlist,),
                    Text("Wishlist",style: TextStyle(color: obj.colorwishlist),),
                  ],
                ),
              ),
              MaterialButton(onPressed: (){
                  obj.account();
              },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.account_circle_outlined,color: obj.coloraccount,),
                    Text("Account",style: TextStyle(color: obj.coloraccount),),
                  ],
                ),
              ),
            ],

          ),

        ),
        body: screen[obj.index],

      );
    });

  }

}
