import 'package:flutter/material.dart';
import 'package:rent_me/hosting/address.dart';
import 'package:rent_me/hosting/basic_info.dart';
import 'package:rent_me/commons/theme.dart';
import 'package:rent_me/hosting/photos.dart';

class PostProperty extends StatefulWidget {
  @override
  _PostPropertyState createState() => _PostPropertyState();
}

class _PostPropertyState extends State<PostProperty> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload Listing",
          style: TextStyle(fontSize: 20.0),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: gradientColorBackground),
        ),
        bottom: TabBar(
          controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(text: "Basic Info",),
              Tab(text: "Address",),
              Tab(text:   "Photos")
            ]),
      ),
      body: TabBarView(
        controller: _tabController,
          children: <Widget>[
            BasicInfo(),
            Address(),
            Photos()
          ],)
    );
  }
}

//Container(
//child: Padding(
//padding: const EdgeInsets.all(8.0),
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//GradientProgressIndicator(
//gradient: gradientColorBackground,
//value: 0.0,
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: GradientText("0% Completed",
//gradient: gradientColorText,
//style:
//TextStyle(fontWeight: FontWeight.w600, fontSize: 25.0)),
//),
//Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.only(left: 20.0),
//child: GradientText(
//"I am",
//style: TextStyle(
//fontSize: 20.0, fontWeight: FontWeight.w500),
//gradient: gradientColorText,
//),
//),
//Padding(
//padding: const EdgeInsets.all(20.0),
//child: Container(
//child: Wrap(
//spacing: 5.0,
//runSpacing: 3.0,
//children: <Widget>[
//ChoiceChips(chipName: "Owner",),
//ChoiceChips(chipName: "Broker",)
//],
//),
//),
//),
//Padding(
//padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
//child: TextField(
//decoration: InputDecoration(
//labelText: "Name"
//),
//),
//),
//Padding(
//padding: const EdgeInsets.all(20.0),
//child: GradientButton(
//increaseHeightBy: 5.0,
//increaseWidthBy: 100.0,
//gradient: Gradients.rainbowBlue,
//child: Text(
//"Next",
//style: TextStyle(fontSize: 20.0),
//),
//callback: (){
//Navigator.push(context, PageTwo());
//},
//),
//)
//],
//),
//],
//),
//),
//),