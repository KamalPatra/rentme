import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:rent_me/commons/theme.dart';
import 'package:rent_me/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> cities = [
    "images/currentLocation.png",
    "images/delhi.png",
    "images/gurgaon.png",
    "images/noida.png"
  ];
  List<String> cityNames = ["Locate", "Delhi", "Gurugram", "Noida"];
  List<String> collectionsImages = [
    "images/bachelors.png",
    "images/nightlife.png",
    "images/commute.png"
  ];
  List<String> collectionsText = [
    "Bachelor Friendly",
    "Great Nightlife",
    "Great Commute"
  ];
  List<String> genresImages = [
    "images/men.png",
    "images/women.png",
    "images/family.png"
  ];
  List<String> genresText = ["For Men", "For Women", "For Family"];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              pinned: true,
              expandedHeight: SizeConfig.safeBlockVertical * 15,
              automaticallyImplyLeading: false,
              floating: false,
              title: Container(
                decoration: BoxDecoration(gradient: gradientColorBackground),
                child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: Row(children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            cursorColor: Colors.deepPurpleAccent,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.blueAccent)),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.deepPurpleAccent,
                        ),
                      ]),
                    )),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(gradient: gradientColorBackground),
                child: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Container(
                    decoration:
                        BoxDecoration(gradient: gradientColorBackground),
                  ),
                  title: Text("What can we help you find, Kamal?",
                      style: TextStyle(fontSize: 15.0)),
                ),
              )),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientText(
                    "Select City",
                    gradient: gradientColorText,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 95.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cities.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30.0,
                                child: ClipOval(
                                  child: SizedBox(
                                      width: 100.0,
                                      height: 100.0,
                                      child: Image.asset(
                                        cities[index],
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                              GradientText(
                                cityNames[index],
                                gradient: gradientColorText,
                                style: null,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientText(
                    "Why RentMe?",
                    gradient: gradientColorText,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  height: 380.0,
                  child: GridView.count(
                    padding: EdgeInsets.all(0.0),
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0,
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Card(
                                elevation: 0.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    "images/money.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GradientText(
                                  "Save your Money: No brokerage fee",
                                  gradient: gradientColorText,
                                  style: null,
                                ),
                              )
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Card(
                                elevation: 0.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    "images/money.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GradientText(
                                  "Save your Money: No brokerage fee",
                                  gradient: gradientColorText,
                                  style: null,
                                ),
                              )
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Card(
                                elevation: 0.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    "images/money.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GradientText(
                                  "Save your Money: No brokerage fee",
                                  gradient: gradientColorText,
                                  style: null,
                                ),
                              )
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Card(
                                elevation: 0.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    "images/money.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GradientText(
                                  "Save your Money: No brokerage fee",
                                  gradient: gradientColorText,
                                  style: null,
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientText(
                    "Collections",
                    gradient: LinearGradient(
                        colors: [Colors.deepPurpleAccent, Colors.blueAccent]),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  height: 150.0,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: collectionsImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Card(
                                    elevation: 6.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    child: ClipRRect(
                                      child: Image.asset(
                                        collectionsImages[index],
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                  Text(
                                    collectionsText[index],
                                    style: cardTextStyle(),
                                  )
                                ]));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientText(
                    "Find Properties for",
                    gradient: gradientColorText,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  height: 150.0,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: collectionsImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  Card(
                                    elevation: 6.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    child: ClipRRect(
                                      child: Image.asset(
                                        genresImages[index],
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                  Text(
                                    genresText[index],
                                    style: cardTextStyle(),
                                  )
                                ]));
                      }),
                ),
                Container(
                  decoration: BoxDecoration(gradient: gradientColorBackground),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "List your property",
                          style: cardTextStyle(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Fill out a form and we will do the rest",
                          style: cardTextStyle(),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.offline_pin,
                          color: Colors.white,
                        ),
                        title: Text(
                          "0 Brokerage Fee",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.offline_pin,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Genuine Leads",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.offline_pin,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Unparalleled Convenience",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 230.0, bottom: 8.0),
                        child: RaisedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, "/Host"),
                          textColor: Colors.deepPurpleAccent,
                          color: Colors.white,
                          elevation: 5.0,
                          padding: EdgeInsets.all(10.0),
                          child: Text("Post Property Now"),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ]),
          ]))
        ],
      ),
    );
  }
}

TextStyle cardTextStyle() {
  return TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );
}
