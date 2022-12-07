import 'package:courses_app/controller/login_controller.dart';
import 'package:courses_app/cubits/login/login_logic.dart';
import 'package:courses_app/cubits/login/login_state.dart';
import 'package:courses_app/shared/customtextfield.dart';
import 'package:courses_app/view/homepage_view.dart';
import 'package:courses_app/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  bool isLoading=false;

  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

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
          child: const Text('User Not Found',style: TextStyle(color: Colors.white),),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){
      if(state is LoginLoading){
        print("loading...");
        isLoading=true;

      }
      else if(state is LoginSuccess)
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home()));
        isLoading=false;
      }
      else if(state is LoginFailure)
      {
        isLoading=false;
        emailController.text="";
        passwordController.text="";

        _show(context);
        print("bad");
      }
    },
      builder: (context,state)=>Scaffold(

          body:isLoading==true ? Container(color: Colors.black,child: Center(child: CircularProgressIndicator())):
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(child: Container(
              width: double.infinity,
              height: 720,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                          )
                      ),
                      SizedBox(width: 20,),
                      Text("Log in",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Text("Log in with one of following options.",style: TextStyle(fontSize: 17,color: Colors.grey),),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0,right: 0),
                        child: InkWell(onTap: (){},
                          child: Container(
                            decoration: BoxDecoration(
                                color:  Color(0xFF4C4C4C).withOpacity(0.3),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child:Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 70),
                              child: Icon(Icons.apple,color: Colors.white,),
                            ) ,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10),
                        child: InkWell(onTap: (){},
                          child: Container(
                            decoration: BoxDecoration(
                                color:  Color(0xFF4C4C4C).withOpacity(0.3),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child:Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 70),
                              child: Icon(Icons.facebook_outlined,color: Colors.white,),
                            ) ,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Form(
                      key: formstate,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
                            child: customTextFiled(hintText:"Enter your Email" , label: Text("Email",style: TextStyle(color: Colors.white),), textcontroller: emailController ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
                            child: customTextFiled(hintText:"Enter your password" , label: Text("Password",style: TextStyle(color: Colors.white),), textcontroller: passwordController ),
                          ),
                        ],)
                  ),

                  SizedBox(height: 10,),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient:LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.purple,
                              Colors.purpleAccent,

                              //add more colors for gradient
                            ],
                            begin: Alignment.centerLeft, //begin of the gradient color
                            end: Alignment.centerRight, //end of the gradient color
                            stops: [0.1, 0.4, 0.9] //stops for individual color
                          //set the stops number equal to numbers of color
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 110,vertical: 5),
                        child: MaterialButton(onPressed: () {
                          if(formstate.currentState!.validate())
                            {
                              BlocProvider.of<LoginCubit>(context).checkLoginState(email: emailController.text,password: passwordController.text);
                            }
                          else
                            {
                              print("error");
                            }
                        },
                          child: Text("Log in",style: TextStyle(color: Colors.white,fontSize: 16,)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account?",style: TextStyle(color: Colors.grey),),
                      SizedBox(width: 10,),
                      InkWell(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return SignUp();
                        }));
                      },
                          child: Text("Sign up",style: TextStyle(color: Colors.white),)
                      ),
                    ],
                  ),
                ],
              ),
            )
            ),
          )
      )
    );

    }

}
