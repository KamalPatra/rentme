import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class crudOps {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null){
      return true;
    }else {
      return false;
    }
  }

  Future<void> addData(propertyDetails) async{
    if (isLoggedIn()){
      Firestore.instance.collection("property").add(propertyDetails).catchError((e){
        print(e);
      });
    }else{
      print("You need to be logged in");
    }
  }
}