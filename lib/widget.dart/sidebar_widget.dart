import 'package:desktop_app/Styles/app_style.dart';
import 'package:desktop_app/pages/about.dart';
import 'package:desktop_app/pages/home.dart';

import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.mainColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            buildmenu(name: "Home", icon: Icons.home, Onclicked: () => pagesOrder(context, 0),),
            SizedBox(height: 10),
            //Divider(height: 8,thickness: 2,color: AppTheme.light,),
            buildmenu(name:"About",icon: Icons.person, Onclicked   : ()=> pagesOrder(context,1)),
      ]),   
    );
}
Widget buildmenu({required String name,required IconData icon,VoidCallback? Onclicked }){
  return ListTile(
    title: Text(name,style: AppTheme.barlist,),
    leading: Icon(icon,color: AppTheme.light,size: 20,),
    hoverColor: AppTheme.accent,
    onTap: Onclicked,
    
  );
}
void pagesOrder(BuildContext context,int index){
  switch(index){
    case 0:
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
    break;
    case 1:
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutPage()));
  }
}
}