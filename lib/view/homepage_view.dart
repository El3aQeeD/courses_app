import 'package:courses_app/controller/homepage_controller.dart';
import 'package:courses_app/cubits/homepage/homepage_logic.dart';
import 'package:courses_app/cubits/homepage/homepage_state.dart';
import 'package:courses_app/shared/appbar.dart';
import 'package:courses_app/shared/bottomappbar.dart';
import 'package:courses_app/view/coursedetails_view.dart';
import 'package:courses_app/view/login_view.dart';
import 'package:courses_app/view/mylearning_view.dart';
import 'package:courses_app/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Home extends StatelessWidget {
  

void _show(BuildContext ctx) {
  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.red.withOpacity(0.5),
      context: ctx,
      builder: (ctx) => Container(
        width: 300,
        height: 50,
        color: Colors.red,
        alignment: Alignment.center,
        child: const Text('Something want wrong',style: TextStyle(color: Colors.white),),
      ));
}
bool isLoading=true;

  @override
  Widget build(BuildContext context) {
   var obj=HomePageCubit.getObj(context);
   obj.checkHomePageState();

    return BlocConsumer<HomePageCubit,HomePageState>(
        listener:(context,state){
          if(state is HomePageLoading){
            print("loading...");
            isLoading=true;

          }
          else if(state is HomePageSuccess)
          {
            print("niceHome");
            print(obj.response);
            isLoading=false;
          }
          else if(state is HomePageFailure)
          {
            _show(context);
            isLoading=false;

            print("bad");
          }
        },
        builder: (context,state){
          return
            Scaffold(

            body: isLoading==true ? Container(color: Colors.black,child: Center(child: CircularProgressIndicator())):
            SafeArea(
              child: Container(color: Colors.black ,
                height:  MediaQuery.of(context).size.height,
                child: ListView(
                  shrinkWrap: true,
                  physics:BouncingScrollPhysics(),
                  children: [
                    //start of app bar
                    appBar("Khaled"),
                    //end of app bar
                    SizedBox(height: 20,),
                    //start of categories
                     Container(
                        height: 60,
                        //width: double.infinity,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: obj.response['data']!.length
                            ,itemBuilder: (context,i){
                          return Row(
                            children: [
                              Container(
                                height: 50,
                                //width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Center(child: AutoSizeText(minFontSize: 9,maxLines:2 ,"${obj.response['data'][i]['course_name']}",style: TextStyle(fontSize: 16,color: Colors.white),
                                  )
                                  ),
                                ),

                              ),
                              SizedBox(width: 10,)
                            ],
                          );
                        }
                        ),
                      ),

                          //end of categories

                    SizedBox(height: 20,),
                    //start of grid
                     Container(

                              //height: MediaQuery.of(context).size.height,
                              child: GridView.builder(
                                  itemCount: obj.response['data']!.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 10,childAspectRatio: 100 / 110 ),
                                  itemBuilder: (context,i){
                                return  InkWell(onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                    return CourseDetails(course: obj.response['data'][i]);
                                  }));
                                },
                                  child: Container(
                                    //height: 700,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
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
                                    child:  Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [

                                        ClipRRect(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                                          child: Image.network("http://10.0.2.2/api/upload/${obj.response!['data'][i]['photo']}",fit: BoxFit.cover,) ,
                                          //Image.asset("images/1.jpg",alignment: Alignment.center,),
                                        ),
                                        SizedBox(height: 10,),
                                        AutoSizeText(minFontSize: 12,maxLines:1 ,"${obj.response['data'][i]['course_name']}",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                                        //Text("${snapshot.data['data'][i]['course_name']}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5,),
                                         //AutoSizeText(minFontSize: 12,maxLines:1 ,"${snapshot.data['data'][i]['course_name']}",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                                        Text("${obj.response['data'][i]['Name']}",style: TextStyle(color: Colors.white,fontSize: 12),),
                                        SizedBox(height: 5,),
                                        Text("${obj.response['data'][i]['price']} L.E",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),

                                      ],
                                    ),

                                  ),
                                    );

                              }),
                            ),
                    //end of grid

                  ],

                ) ,
              ),

            ),

          );
        } );

  }
}
