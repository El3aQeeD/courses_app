
import 'package:courses_app/cubits/coursedetails/coursedetails_logic.dart';
import 'package:courses_app/cubits/currentpage/currentpage_logic.dart';
import 'package:courses_app/cubits/homepage/homepage_logic.dart';
import 'package:courses_app/cubits/login/login_logic.dart';
import 'package:courses_app/cubits/search/search_logic.dart';
import 'package:courses_app/cubits/signup/signup_logic.dart';
import 'package:courses_app/cubits/wishlist/wishlist_logic.dart';
import 'package:courses_app/model/homepage_model.dart';
import 'package:courses_app/view/coursedetails_view.dart';
import 'package:courses_app/view/currentpage_view.dart';
import 'package:courses_app/view/homepage_view.dart';
import 'package:courses_app/view/login_view.dart';
import 'package:courses_app/view/signup_view.dart';
import 'package:courses_app/view/test.dart';
import 'package:courses_app/view/tst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()=>runApp(CoursesApp());

class CoursesApp extends StatelessWidget {
  const CoursesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
        BlocProvider(
        create: (context)=>LoginCubit()
        ),
      BlocProvider(
          create: (context)=>SignupCubit(),
      ),
      BlocProvider(
        create: (context)=>HomePageCubit(),
      ),

      BlocProvider(
        create: (context)=>CourseDetailsCubit(),
      ),
      BlocProvider(
        create: (context)=>WishListCubit(),
      ),
      BlocProvider(
        create: (context)=>CurrentPageCubit(),
      ),
      BlocProvider(
        create: (context)=>SearchCubit(),
      ),


    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "Login":(context)=>Login(),
          "SignUp" :(context)=>SignUp(),
        },
        home: CurrentPage(),
      ),
    );
  }
}