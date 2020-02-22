import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class Verification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Text("Almost There"),
              Text("Your listing will be made live after quality checks"),
              Text(""),
              GradientButton(gradient: Gradients.coldLinear, child: Text("Verify Now"), callback: (){debugPrint("I am pressed");}),
              FlatButton(color: Colors.transparent, onPressed: (){debugPrint("I am pressed");}, child: Text("Skip to Add Details"))
            ],
          ),
        ),
      ),
    );
  }
}




//ButtonBar(
//alignment: MainAxisAlignment.start,
//mainAxisSize: MainAxisSize.min,
//children: <Widget>[
//
//Padding(
//padding: const EdgeInsets.only(left: 20.0),
//child: GradientText(
//"Built Up Area",
//style: TextStyle(
//fontSize: 20.0,
//fontWeight: FontWeight.w500),
//gradient: gradientColorText,
//),
//),
//Padding(
//padding: const EdgeInsets.fromLTRB(
//15.0, 0.0, 15.0, 0.0),
////                                child: TextField(),
//),
//Padding(
//padding: const EdgeInsets.only(left: 20.0),
//child: GradientText(
//"Carpet Area(Optional)",
//style: TextStyle(
//fontSize: 20.0,
//fontWeight: FontWeight.w500),
//gradient: gradientColorText,
//),
//),
//Padding(
//padding: const EdgeInsets.fromLTRB(
//15.0, 0.0, 15.0, 0.0),
////                                child: TextField(),
//),
//Padding(
//padding: const EdgeInsets.only(left: 20.0),
//child: GradientText(
//"Floor No.",
//style: TextStyle(
//fontSize: 20.0,
//fontWeight: FontWeight.w500),
//gradient: gradientColorText,
//),
//),
//Padding(
//padding: const EdgeInsets.fromLTRB(
//15.0, 0.0, 15.0, 0.0),
////                                child: TextField(),
//),
//Padding(
//padding: const EdgeInsets.only(left: 20.0),
//child: GradientText(
//"Total Floors",
//style: TextStyle(
//fontSize: 20.0,
//fontWeight: FontWeight.w500),
//gradient: gradientColorText,
//),
//),
//Padding(
//padding: const EdgeInsets.fromLTRB(
//15.0, 0.0, 15.0, 0.0),
////                                child: TextField(),
//),
//Padding(
//padding: const EdgeInsets.only(left: 20.0),
//child: GradientText(
//"Available From",
//style: TextStyle(
//fontSize: 20.0,
//fontWeight: FontWeight.w500),
//gradient: gradientColorText,
//),
//),
//Padding(
//padding: const EdgeInsets.fromLTRB(
//15.0, 0.0, 15.0, 0.0),
////                                child: TextField(),
//),
//Padding(
//padding: const EdgeInsets.only(left: 20.0),
//child: GradientText(
//"Age of Property",
//style: TextStyle(
//fontSize: 20.0,
//fontWeight: FontWeight.w500),
//gradient: gradientColorText,
//),
//),
//Padding(
//padding: const EdgeInsets.fromLTRB(
//15.0, 0.0, 15.0, 0.0),
////                                child: TextField(),
//),
//],
//),