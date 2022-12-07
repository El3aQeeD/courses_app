import 'package:flutter/material.dart';
Widget customTextFiled({required String hintText,required Widget label,required TextEditingController textcontroller}){

  return TextFormField(
    style: TextStyle(color: Colors.white),
    validator: (val){
      if(val!.length<4 && val!.isNotEmpty)
      {
        return "Input less than 4 character";
      }
      if(val!.isEmpty){
        return "Input can not be empty";
      }
    } ,
    controller: textcontroller ,
    decoration: InputDecoration(

      filled: true,
      fillColor: Color(0xFF4C4C4C).withOpacity(0.3),
      label: label,
      labelStyle: TextStyle(fontSize: 18),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.purple, width: 3.0),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,width: 10)
      ),





    ),
  );
}