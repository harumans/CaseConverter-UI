
import 'package:desktop_app/Styles/app_style.dart';
import 'package:desktop_app/widget.dart/sidebar_widget.dart';
import 'package:desktop_app/widget.dart/snackbar_utilitis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller=TextEditingController();  
  String capitlazer="";
  bool isBtnEnabel=false;
  
  void isItenable(){
    setState(() {
      isBtnEnabel=controller.text.isNotEmpty;
    });

  }
void copyToClipBoard(context,String text){
    Clipboard.setData(ClipboardData(text: text));
    snackBar_utils.showSnackBar(context, Icons.content_copy,'Copied text');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainColor,
      appBar: AppBar(backgroundColor: AppTheme.mainColor,title: Text("Home"), titleTextStyle:
      TextStyle(color: AppTheme.light,fontSize: 31,fontWeight: FontWeight.bold),centerTitle: true,),
      drawer: Bar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        // SizedBox(height: 200,),

        Padding(padding: EdgeInsets.symmetric(horizontal: 45),
        child: 
        TextField(
          controller: controller,
          maxLength: 100000,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          cursorColor: AppTheme.accent,
          style: AppTheme.inputeStyle,
            onChanged: (text)=>isItenable(),
          decoration: InputDecoration(
            counterStyle: AppTheme.counterStyle,
            suffixIcon:_copyButton(context),
            hintText: "Enter Your Text",
            hintStyle: AppTheme.hintTextStyle,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.accent,
              )
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.mudiam,
              )
            ),
          ),
        
        ),
        
        ),
        // SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [

        btn(isBtnEnabel? (){
          capitlazer=controller.text.toUpperCase();
          controller.text=capitlazer;

        }:null, "UpperCase"),
        SizedBox(width: 20,),
        btn(isBtnEnabel?()
        {
          capitlazer=controller.text.toLowerCase();
          controller.text=capitlazer;
        }:null, "LowerCase"),
        SizedBox(width: 20,),
        btn(isBtnEnabel ?(){
          capitlazer=controller.text.toLowerCase();
          controller.text=capitlaze(capitlazer);
        }:null, "Capitalize"),
        ],)

      ],),
    );
  }
  ElevatedButton btn(Function()? onPressed,String text){
    return ElevatedButton(onPressed: onPressed,style:_buttonStyle(),child: Text(text));
  }
  ButtonStyle _buttonStyle(){
    return ElevatedButton.styleFrom(backgroundColor: AppTheme.accent,
     textStyle: AppTheme.buttonStyle,
      padding:EdgeInsets.all(16),
      foregroundColor: AppTheme.black,
      disabledBackgroundColor: AppTheme.disabledbackgroundcolor,
      disabledForegroundColor: AppTheme.disabledforegroumdcolor, );
  }
  String capitlaze(String string){
    var str =string.split(". ");
    for(int i =0;i<str.length;i++){
      str[i]=str[i][0].toUpperCase()+ str[i].substring(1);
      }
    return str.join(". "); 
  }
   IconButton _copyButton(BuildContext context) {
    return IconButton(
        onPressed: controller.text.isNotEmpty ? ()=>copyToClipBoard(context,controller.text):null,
        disabledColor: AppTheme.mudiam,
        splashRadius:20,
        padding: EdgeInsets.symmetric(horizontal: 15),
        splashColor: AppTheme.accent,
        color: AppTheme.accent,
        icon: Icon(
          Icons.content_copy_rounded, 
        ));
  }
}