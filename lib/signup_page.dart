import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:rent_me/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'nav_bar.dart';
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _name, _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Auth auth = Auth();
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
//    var divHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.deepPurpleAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
        ),
        Scaffold(
//          resizeToAvoidBottomPadding: false,
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
              "Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Container(
//                  height: divHeight/1.8,
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
                                if (input.isEmpty) {
                                  return "The name field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (input) => _name = input,
                              cursorColor: Colors.pinkAccent,
                              decoration: InputDecoration(
                                  labelText: "Name",
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
                                if (input.length < 6) {
                                  return "Your password needs to be atleast 6 characters";
                                } else if (input.isEmpty) {
                                  return "The password field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (input) => _password = input,
                              obscureText: true,
                              cursorColor: Colors.pinkAccent,
                              decoration: InputDecoration(
                                  labelText: "Create Password",
                                  border: OutlineInputBorder(
                                      gapPadding: 3.0,
                                      borderRadius:
                                      BorderRadius.circular(3.0))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GradientButton(
                                increaseHeightBy: 5.0,
                                increaseWidthBy: 100.0,
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.blueAccent,
                                      Colors.deepPurpleAccent
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                callback: validateForm),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Already Have an Account?",
                                    style: TextStyle(color: Colors.grey)),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: GradientText(
                                      "Login",
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
                        onPressed: (){
                          auth.googleSignIn();
//                          _login();
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

void validateForm() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pop(context);
      }catch(e) {
        print(e.toString());
      }
    }
  }
}