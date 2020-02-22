import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:rent_me/hosting/page_four.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'nav_bar.dart';
import 'package:rent_me/hosting/host_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() {
  SystemChrome.setPreferredOrientations([

  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
      ),
      home: _handleWindowDisplay(),
      routes: <String, WidgetBuilder>{
        "/SignUp": (BuildContext context) => SignUpPage(),
        "/Login": (BuildContext context) => LoginPage(),
        "/Home": (BuildContext context) => NavBar(),
        "/Host": (BuildContext context) => PostProperty(),
        "/PageFour": (BuildContext context) => Verification()
      },
    );
  }
}

//Have to work on Android side of the app and continue building Home Screen.
Widget _handleWindowDisplay(){
  return StreamBuilder(
    stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Container(decoration: BoxDecoration(
            gradient: Gradients.coldLinear), child: Center(child: Text("Loading", style: TextStyle(fontSize: 25.0),),),);
      }else {
        if(snapshot.hasData){
          return NavBar();
        }else {
          return LoginPage();
        }
      }
      });
}