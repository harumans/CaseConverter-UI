import 'package:desktop_app/Styles/app_style.dart';
import 'package:desktop_app/widget.dart/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


final Uri _url = Uri.parse('https://github.com/harumans');
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About",),centerTitle: true,backgroundColor: AppTheme.mainColor,),
      drawer: Bar(),
      backgroundColor: AppTheme.mainColor,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 600,
                  // height: 220, 
                  child: Text("Welcome to my app. This small application is a tool to edit your text (convert case).",style: AppTheme.aboutStyle,),
                ),
              ],
            ),
            SizedBox(height: 50,),
                Container(width: 600,
                
                  child:
                Text("If you have any idea about how to improve the application feel free to contact me in my github or you can just take the source code and eddit it for your self . Anyway thank you so much for trying my project.",
                style: AppTheme.aboutStyle,)
                ),
                SizedBox(height: 92,),
                _btn("GitHub"),
                
             
          ],
        ),
      ),
    );
  }
  ElevatedButton _btn(String text){
    return ElevatedButton(onPressed: _launchUrl,

  style: _buttonStyle(), child: Text(text));

 
  }
  ButtonStyle _buttonStyle(){
    return ElevatedButton.styleFrom(backgroundColor: AppTheme.accent,
     textStyle: AppTheme.buttonStyle,
      padding:EdgeInsets.all(16),
      foregroundColor: AppTheme.black,
      disabledBackgroundColor: AppTheme.disabledbackgroundcolor,
      disabledForegroundColor: AppTheme.disabledforegroumdcolor, );
  }
  
    Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
  }
  
} 