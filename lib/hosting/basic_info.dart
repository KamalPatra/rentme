import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:rent_me/commons/chip_design.dart';
import 'package:rent_me/commons/theme.dart';
//import 'package:rent_me/utils/firestore_helper.dart';

class BasicInfo extends StatefulWidget {
//  final DocumentReference documentReference = Firestore.instance.document("propertyData/details");
  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  String id,
      name,
      availableFrom,
      rent,
      maintenance,
      securityDeposit,
      builtUpArea,
      carpetArea,
      propType,
      furType,
      rooms,
      nego,
      familyType,
      stayTime,
      workType,
      site,
      propHistory,
      local;
  final db = Firestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> propertyDetails;
  List<String> sellerType = ["Owner", "Broker"];
  List<String> propertyType = [
    "Apartment",
    "Independent Floor",
    "Independent House",
    "Villa"
  ];
  List<String> furnishType = [
    "Fully Furnished",
    "Semi Furnished",
    "Unfurnished"
  ];
  List<String> bhkType = [
    "1 RK", "1 BHK", "2 BHK", "3 BHK", "4 BHK", "5 BHK",
    "6 BHK", "7 BHK", "8 BHK", "9 BHK",
  ];
  List<String> negotiation = ["Yes", "No"];
  List<String> tenantType = ["Family", "Bachelors", "Company"];
  List<String> stayDuration = ["6 months", "1 Year", "2 Year", "Any"];
  List<String> professionType = [
    "Professional/Salaried",
    "Business",
    "Student",
    "Any"
  ];
  List<String> siteVisit = ["Yes", "No"];
  List<String> localite = [
    "In the same building",
    "Nearby",
    "In different country/city"
  ];
  List<String> propertyPast = ["Yes", "No"];

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
                    padding: const EdgeInsets.only(left: 20.0),
                    child: GradientText(
                      "I am",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                      gradient: gradientColorText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        child: ChoiceChips(
                      chipName: sellerType,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return "Please enter you name";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (input) => name = input,
                      decoration: InputDecoration(labelText: "Name"),
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
//                      onFieldSubmitted: (input) => this.availableFrom = input,
//                      controller: textController,
                      onSaved: (input) => availableFrom = input,
                      decoration: InputDecoration(labelText: "Available From"),
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
                      onSaved: (input) => rent = input,
                      decoration: InputDecoration(labelText: "Monthly Rent"),
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
                      onSaved: (input) => maintenance = input,
                      decoration: InputDecoration(
                          labelText: "Maintenance Charges(per month)"),
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
                      onSaved: (input) => securityDeposit = input,
                      decoration:
                          InputDecoration(labelText: "Security Deposit"),
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
                      onSaved: (input) => builtUpArea = input,
                      decoration: InputDecoration(labelText: "Built Up Area"),
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
                      onSaved: (input) => carpetArea = input,
                      decoration:
                          InputDecoration(labelText: "Carpet Area(Optional)"),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 0.0),
                        child: GradientText(
                          "Property type",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                          gradient: gradientColorText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: ChoiceChips(
                              chipName: propertyType,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GradientText(
                          "Select BHK",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                          gradient: gradientColorText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: ChoiceChips(
                          chipName: bhkType,
                        )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                        child: GradientText(
                          "Furnish type",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                          gradient: gradientColorText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: ChoiceChips(
                          chipName: furnishType,
                        )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                        child: GradientText(
                          "Is the rent amount negotiable?",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                          gradient: gradientColorText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: ChoiceChips(
                          chipName: negotiation,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GradientText(
                          "Preffered Tenant Type",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                          gradient: gradientColorText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: ChoiceChips(
                          chipName: tenantType,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GradientText(
                          "Expected duration of stay(min.)",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                          gradient: gradientColorText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: ChoiceChips(
                          chipName: stayDuration,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GradientText(
                          "Preffered work type of Tenants",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                          gradient: gradientColorText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: ChoiceChips(
                          chipName: professionType,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GradientText(
                          "Can you manage the site visits on your own?",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                          gradient: gradientColorText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: ChoiceChips(
                          chipName: siteVisit,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GradientText(
                          "I curently live",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                          gradient: gradientColorText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: ChoiceChips(
                          chipName: localite,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GradientText(
                          "Have you rented out any property before?",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                          gradient: gradientColorText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: ChoiceChips(
                          chipName: propertyPast,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GradientButton(
                            increaseHeightBy: 5.0,
                            increaseWidthBy: 100.0,
                            gradient: Gradients.rainbowBlue,
                            child: Text(
                              "Next",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            callback: createData),
                      )
                    ],
                  ),
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
      DocumentReference ref = await db.collection('CRUD').add({
        'name': '$name',
        'dateAvailFrom': '$availableFrom',
        'rent': '$rent',
        'mainCost': '$maintenance',
        'secDeposit': '$securityDeposit',
        'builtUpArea': '$builtUpArea',
        'carpetArea': '$carpetArea'
      });
      setState(() {
        id = ref.documentID;
      });
      print(ref.documentID);
    }
  }
}
//      DocumentReference ds = Firestore.instance.collection("properties")
//          .document(name);
//      Map<String, dynamic> propertyDetails = {
//        "name": name,
//        "dateAvailFrom": availableFrom,
//        "rent": rent,
//        "mainCost": maintenance,
//        "secDeposit": securityDeposit,
//        "builtUpArea": builtUpArea,
//        "carpetArea": carpetArea
//      };
//      ds.setData(propertyDetails).whenComplete(() {
//        print("data successfully updated!$name");
//      });

//  void validateForm(){
//    if (_formKey.currentState.validate()) {
////      propertyDetails = {
////        "name": name,
////        "dateAvailFrom": availableFrom,
////        "rent": rent,
////        "mainCost": maintenance,
////        "secDeposit": securityDeposit,
////        "builtUpArea": builtUpArea,
////        "carpetArea": carpetArea
////      };
//      crudObj.addData({
//        "name": this.name,
//        "dateAvailFrom": this.availableFrom,
//        "rent": this.rent,
//        "mainCost": this.maintenance,
//        "secDeposit": this.securityDeposit,
//        "builtUpArea": this.builtUpArea,
//        "carpetArea": this.carpetArea
//      }).then((result){print("data added succesfully!${this.name}");}).catchError((e) {
//        print(e);
//      });
//    }
//  }
