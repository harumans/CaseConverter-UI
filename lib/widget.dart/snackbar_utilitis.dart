import 'package:desktop_app/Styles/app_style.dart';
import 'package:flutter/material.dart';
class snackBar_utils{
  static void showSnackBar(BuildContext context, IconData icon,String message){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
    Row(children: [
      Icon(icon,color: AppTheme.accent,),
      SizedBox(width: 8,),
      Text(message,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      
    ],)
    ));

  }
}