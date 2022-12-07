import 'package:courses_app/controller/coursedetails_controller.dart';
import 'package:courses_app/cubits/coursedetails/coursedetails_logic.dart';
import 'package:courses_app/cubits/coursedetails/coursedetails_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetails extends StatelessWidget {
  void _show(BuildContext ctx,String text) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.red.withOpacity(0.5),
        context: ctx,
        builder: (ctx) => Container(
          width: 300,
          height: 50,
          color: Colors.green.shade100,
          alignment: Alignment.center,
          child: Text(text,style: TextStyle(color: Colors.black),),
        ));
  }
  Map? course;
  bool isLoading=true;
  var modelsheetresponse;
  CourseDetails({required this.course});

  @override
  Widget build(BuildContext context) {
    var obj=CourseDetailsCubit.getObj(context);

    obj.checkCourseDetailsState(courseId: course!['course_id'],videoCreatorId: course!['user_id']);
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width ;
    return BlocConsumer<CourseDetailsCubit,CourseDetailsState>(
        listener:(context,state){
      if(state is CourseDetailsLoading){
        print("loading......");
        isLoading=true;
        print(course);
      }
      else if(state is CourseDetailsSuccess)
      {
        isLoading=false;

      }
      else if(state is CourseDetailsFailure)
      {
        isLoading=false;
        print("bad");
      }
    },
    builder: (context,state) {
      return Scaffold(
        body: isLoading==true ? Container(color: Colors.black,child: Center(child: CircularProgressIndicator())):
        SafeArea(
            child: Container(
              height: screenHeight,
              width: screenWidth,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                //scrolling page
                child: ListView(

                  physics: BouncingScrollPhysics(),
                  children:[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //start back arrow
                        IconButton(onPressed: () {
                          Navigator.of(context).pop();
                        }, icon: Icon(Icons.arrow_back_ios_outlined, color: Colors
                            .white,),),
                        //end back arrow

                        //image start
                        Container(
                          height: screenHeight * 1 / 5,
                          width: screenWidth,
                          // color: Colors.red,
                          child: Image.network("http://10.0.2.2/api/upload/${course!['photo']}") ,
                          //Image.asset("images/1.jpg", alignment: Alignmen.center,),
                        ),
                        //image end
                        SizedBox(height: 20,),
                        // course title
                        Text("${course!["course_name"]}",
                          style: TextStyle(color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        // course description
                        Text("${course!["description"]}.",
                          style: TextStyle(color: Colors.white, fontSize: 20),),
                        SizedBox(height: 10,),
                        // course reviews
                        Row(
                          children: [
                            Text("4.9", style: TextStyle(
                                color: Colors.orange.shade900, fontSize: 19),),
                            SizedBox(width: 5,),
                            for(int i = 0; i < 5; i++)
                              Icon(Icons.star, color: Colors.orange, size: 20,),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text("(970 ratings) 6,612 students",
                          style: TextStyle(color: Colors.white, fontSize: 14),),
                        SizedBox(height: 20,),
                        // course created by
                        Row(
                          children: [
                            Text("Created By ", style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),),
                            InkWell(onTap: () {},
                                child: Text("${obj.response2['data'][0]['Name']}", style: TextStyle(
                                    color: Colors.deepPurple.shade300,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),)),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.error, color: Colors.grey.shade400,
                              size: 18,),
                            Text("  Last updated ${course!['Date']}", style: TextStyle(
                                color: Colors.white, fontSize: 14),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.language, color: Colors.grey.shade400,
                              size: 18,),
                            Text("  Arabic", style: TextStyle(
                                color: Colors.white, fontSize: 14),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        //course price
                        Text("${course!["price"]} L.E",
                          style: TextStyle(color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),),
                        //button one start
                        Container(

                          decoration: BoxDecoration(
                            //color: Colors.deepPurple,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff886ff2),
                                Color(0xff6849ef),

                                //add more colors for gradient
                              ],
                              begin: Alignment.topLeft,
                              //begin of the gradient color
                              end: Alignment.topRight, //end of the gradient color
                            ),
                          ),
                          width: screenWidth,
                          child: MaterialButton(
                            onPressed: () {

                            },
                            // color: Colors.deepPurple,
                            child: Text("Buy now", style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),),
                          ),
                        ),
                        //button one end
                        SizedBox(height: 10,),
                        //button two start
                        Container(

                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.white, //color of border
                              width: 1, //width of border
                            ),
                          ),
                          width: screenWidth,
                          child: MaterialButton(
                            onPressed: ()async {
                              modelsheetresponse=await CourseDetailsController().addToWishList(courseId: course!['course_id'], userId: "1");
                              if( modelsheetresponse['status']=='success')
                                {

                                  _show(context,"Course added to your wishlist");
                                }
                              else
                                {
                                  _show(context,"Error while adding course to your wishlist");
                                }


                            },
                            // color: Colors.deepPurple,
                            child: Text("Add to wishlist", style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),),
                          ),
                        ),
                        //button two end
                        SizedBox(height: 20,),
                        Text("Course Videos :",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        obj.response['status']=='fail' ? Container(color: Colors.black,child: Center(child: Text("No videos added to this course",style: TextStyle(color: Colors.white),),)) :            //course_videos
                           Container(

                                  //width: double.infinity,
                                  child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:obj.response['data']!.length
                                  ,itemBuilder: (context,i){
                                  return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(

                                  child: ListTile(
                                  leading: Text("${i+1}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                  trailing: Icon(Icons.play_circle_outline_outlined,color: Colors.white,size: 30,),
                                  title: Text("${obj.response['data'][i]['video_title']}",style: TextStyle(color: Colors.white,fontSize: 20)),

                                  subtitle: Text("video",style: TextStyle(color: Colors.white),),),
                            ),
      );
      }
      ),
      )











                      ],
                    ),
                  ]

                ),
              ),
            )
        ),
      );
    }
    );
    }
}
