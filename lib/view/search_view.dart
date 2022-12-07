import 'package:courses_app/cubits/search/search_logic.dart';
import 'package:courses_app/cubits/search/search_state.dart';
import 'package:courses_app/view/homepage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {

  bool isLoading=true;
  List icons = [
    Icons.code,
    Icons.data_exploration,
    Icons.developer_mode_outlined,
    Icons.business_sharp,
    Icons.monetization_on_rounded,
    Icons.computer_outlined,
    Icons.list_alt_outlined,
    Icons.design_services_rounded,
    Icons.school_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    var obj=SearchCubit.getObj(context);
    obj.getData();
    obj.getCourses();

    return BlocConsumer<SearchCubit,SearchState>( listener: (context,state){
        if(state is SearchSuccess)
          {
            isLoading = false;
          }
        else if (state is SearchLoading)
          {
            isLoading = true;
          }
        else if (state is SearchFailure)
          {
            isLoading = false;
          }
    },
      builder:(context,state){
      return Scaffold(
        body: SafeArea(
          child: Container(color: Colors.black ,
            child: ListView(
              physics:BouncingScrollPhysics(),
              children: [
                Container(
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
                            Text("Start Searching \n  click the icon  ",style: TextStyle(color: Colors.white,fontSize: 26),),
                            SizedBox(width: 120,),
                            CircleAvatar(maxRadius: 30,backgroundColor: Colors.grey, child: IconButton(onPressed: (){
                              showSearch(context: context, delegate: SearchCourses(courses: obj.responsecourses));
                            },icon: Icon(Icons.search,color: Colors.white,size: 30,),),)
                          ],
                        )
                      ],
                    )
                ),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child: Text("Browse categories",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),),
                ),
                isLoading == true ? Container(
                  child: Center(child: CircularProgressIndicator(),),
                ) :
                    obj.response['status'] != "success" ? Center(child: Text("Error while getting categories"),) :
                Container(
                  color: Colors.black,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: obj.response!['data']!.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(onTap: (){},
                            child: ListTile(
                              trailing: IconButton(icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white),onPressed: (){},),
                              leading: Icon(icons[i],color: Colors.white,),
                              title: Text(obj.response!['data'][i]['course_type'],style: TextStyle(color: Colors.white),),

                            ),
                          ),
                        );
                      }

                  ),
                ),

              ],
            ) ,
          ),

        ),
      );
    },
    );

  }
}

class SearchCourses extends SearchDelegate
{
  List? filtercourses=[];
  List? courseslist=[];
  Map? courses;
  SearchCourses({required this.courses});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        query="";
      }, icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {

  }

  @override
  Widget buildResults(BuildContext context) {

    return  Container(
      color: Colors.black,
      child:  filtercourses!.isEmpty || query == "" ? Center(child: Text("start search",style: TextStyle(color: Colors.white),),) :
      Text("${filtercourses![0]}",style: TextStyle(color: Colors.white),),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print(courses!['data'].where((element) => element.startsWith(query) ).toList);
    var lowercasequery= query.toLowerCase();
    courseslist=[];
    for(int i=0;i<courses!['data'].length;i++)
      {
        var val =courses!['data'][i]['course_name'];
          if( val != "")
          {
            val=val.toLowerCase();
            courseslist!.add(val);
          }
      }
    print(courseslist);
     filtercourses = courseslist!.where((element) => element.contains(lowercasequery)).toList();

    return Container(
      color: Colors.black,
      child: ListView.builder(

          itemCount: query == "" ? courses!['data'].length : filtercourses!.length,
          itemBuilder: (context,i){
            return Padding(padding: EdgeInsets.all(9),
              child: query == "" ? ListTile( title:Text("${courses!['data'][i]['course_name']}",style: TextStyle(color: Colors.white),)) :
              ListTile( leading: Icon(Icons.search,color: Colors.grey,),
                  title: Text("${filtercourses![i]}",style: TextStyle(color: Colors.white),)) ,

            );

      }),
    );
        
  }

}
