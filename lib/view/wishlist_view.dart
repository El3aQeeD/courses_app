import 'package:courses_app/controller/wishlist_controller.dart';
import 'package:courses_app/cubits/wishlist/wishlist_logic.dart';
import 'package:courses_app/cubits/wishlist/wishlist_state.dart';
import 'package:courses_app/shared/bottomappbar.dart';
import 'package:courses_app/view/coursedetails_view.dart';
import 'package:courses_app/view/mylearning_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishList extends StatelessWidget {

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

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {

    var obj = WishListCubit.getObj(context);
    obj.checkCourseDetailsState(userId: "1");

    return BlocConsumer<WishListCubit, WishListState>(
        listener: (context, state) {
          if (state is WishListLoading) {
            isLoading = true;
          }
          else if (state is WishListSuccess) {

            isLoading = false;
          }
          else if (state is WishListFailure) {

            isLoading = false;
          }

        },
        builder: (context, state) {
          return Scaffold(

              body: isLoading == true ? Container(color: Colors.black,
                  child: Center(child: CircularProgressIndicator())) :
              SafeArea(
                  child: obj.response!["status"]== "fail" || obj.wishlistEmpty == true ? Container(color: Colors.black,child: Center(child: Text("No courses added to wishlist",style: TextStyle(color: Colors.white,fontSize: 20),),)) :
                  Container(
                    color: Colors.black,
                    child: ListView.builder(
                        itemCount: obj.response!['data']!.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(onTap: (){
                                print(obj.response!['data'][i]);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                  return CourseDetails(course: obj.response!['data'][i]);
                                }));

                            },
                              child: ListTile(
                                trailing: IconButton(icon: Icon(Icons.delete,color: Colors.grey,),onPressed: () async{
                                      var response =await WishListController().deleteData(dataId: obj.response!['data'][i]['wishlist_id']);
                                          obj.deleteWishListRow(i);
                                          _show(context, "Course removed from your wishlist");


                                },),
                                leading:Image.network("http://10.0.2.2/api/upload/${obj.response!['data'][i]['photo']}",width: 100,height: 80,) ,
                                title: Text(obj.response!['data'][i]['course_name'],style: TextStyle(color: Colors.white),),
                                subtitle: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Text("${obj.response!['data'][i]['price']} L.E",style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                              ),
                            ),
                          );
                        }

                    ),
                  )
              )
          );
        }
    );
  }
}
