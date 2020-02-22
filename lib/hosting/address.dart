import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {

  final db = Firestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String id, street, address, city, building, floorNo, floors, flatNo, locality;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (input) => street = input,
                          decoration: InputDecoration(
                              labelText: "Search for Street/Area/Landmark"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (input) => city = input,
                          decoration: InputDecoration(labelText: "City"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (input) => locality = input,
                          decoration: InputDecoration(labelText: "Locality"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (input) => building = input,
                          decoration: InputDecoration(
                              labelText: "Building/Project/Society"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (input) => flatNo = input,
                          decoration: InputDecoration(labelText: "Flat No."),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (input) => floorNo = input,
                          decoration: InputDecoration(labelText: "Floor No."),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (input) => floors = input,
                          decoration: InputDecoration(labelText: "Total Floors"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (input) => address = input,
                          decoration: InputDecoration(labelText: "Address"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GradientButton(
                          increaseHeightBy: 5.0,
                          increaseWidthBy: 100.0,
                          gradient: Gradients.rainbowBlue,
                          child: Text(
                            "Confirm location",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          callback: createData
                        ),
                      )
                    ],
                  ),
                ),
          ),
        ),
      ),
    );
  }

  createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db.collection('CRUD').document().collection("Property Address").add({
        'street': '$street 😎',
        'city': '$city',
        'locality': '$locality',
        'flatNo.': '$flatNo',
        'floorNo.': '$floorNo',
        'totalFloors': '$floors',
        'address': '$address'
      });
      setState(() {
        id = ref.documentID;
      });
      print(ref.documentID);
    }
  }
}
