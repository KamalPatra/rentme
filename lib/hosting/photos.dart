import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

class Photos extends StatefulWidget {
  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (context) => Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 20.0),
                        child: Center(
                          child: DottedBorder(
                            color: Colors.deepPurpleAccent,
                            strokeWidth: 2,
                            child: GestureDetector(
                              onTap: getImage,
                              child: Container(
                                height: 150.0,
                                width: 150.0,
//                              decoration: BoxDecoration(
//                                image: DecorationImage(image: Image.)
//                              ),
                                child: _image == null ? Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.add_a_photo,
                                      size: 30.0,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    Center(
                                      child: ListTile(

                                        title: Text("+ Add Photos"),
                                        subtitle: Text("(max limit 5MB per image)"),
                                      ),
                                    ),
                                  ],
                                ) : Image.file(_image, fit: BoxFit.fill,),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.offline_pin, color: Colors.green,),
                        title: Text("Atleast 8 photos"),
                        subtitle: Text(" will increase property quality score by 15%"),
                      ),
                      ListTile(
                        leading: Icon(Icons.offline_pin, color: Colors.green,),
                        title: Text(" Hall, Bedroom, Kitchen and Bathroom"),
                        subtitle: Text(" photos will get more points in quality score"),
                      ),
                      GradientButton(
                          increaseHeightBy: 5.0,
                          increaseWidthBy: 100.0,
                          gradient: Gradients.rainbowBlue,
                          child: Text("Upload Property", style: TextStyle(fontSize: 20.0),),
                          callback: () {
                            uploadPic(context);
//                            Navigator.pushNamed(context, "/PageFour");
                          }
                            //TODO Popup dialogue if user skips photo upload
                            //Enter your phone number textfield and button with continue>>
                            //verification by otp >> Complete your profile and textfield Email with submit button
                            )
                    ],
                  ),
                ),
          ),
    );
  }

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

 Future uploadPic(BuildContext context) async{
    String filename = basename(_image.path);
    StorageReference firebaseStorageRef =  FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      print("Profile Picture uploaded");
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Profile Picture Uploaded")));
    });
 }
}
