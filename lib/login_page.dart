import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'nav_bar.dart';
import 'package:rent_me/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String   _email, _password;
  Auth auth = Auth();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: Gradients.coldLinear),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: null),
            title: Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Container(
//                  height: divHeight/2*0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty && !input.contains("@")) {
                                  return "Please type an email";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (input) => _email = input,
                              cursorColor: Colors.pinkAccent,
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                      gapPadding: 3.0,
                                      borderRadius:
                                          BorderRadius.circular(3.0))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (input) {
                                if (input.length <6){
                                  return "Your password needs to be atleast 6 characters";
                                } else if (input.isEmpty){
                                  return "The password field cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              onSaved: (input) => _password = input,
                              obscureText: true,
                              cursorColor: Colors.pinkAccent,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                      gapPadding: 3.0,
                                      borderRadius:
                                          BorderRadius.circular(3.0))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200.0),
                            child: FlatButton(
                                onPressed: () => debugPrint("forgot password"),
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GradientButton(
                                increaseHeightBy: 5.0,
                                increaseWidthBy: 100.0,
                                gradient: Gradients.rainbowBlue,
                                child: Text(
                                  "Login",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                callback: signIn),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Don't Have an Account?",
                                    style: TextStyle(color: Colors.grey)),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/SignUp");
                                    },
                                    child: GradientText(
                                      "Sign Up",
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.deepPurpleAccent,
                                            Colors.blueAccent
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight),
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "OR use social media account",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: "btn1",
                        onPressed: () => debugPrint("Facebook"),
                        child: Image.asset("images/facebook_circle-512.png"),
                      ),
                      FloatingActionButton(
                        heroTag: "btn2",
                        onPressed: () async{
                          FirebaseUser user = await auth.googleSignIn();
                          if(user == null){
                            DocumentReference dRef = await db.collection("userDetails").add({
                              "name": "$user.displayName",
                              "uid": "$user.uid",
                              "photo": "$user.photoUrl",
                              "email": "$user.email"
                            });
                          }
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar()));
                        },
                        child: Image.asset("images/Google_cirle512.png"),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }


  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NavBar()));
      } catch (e) {
        print(e.message);
      }
    }
  }



}




