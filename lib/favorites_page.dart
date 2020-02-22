import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Favorites 💜️"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.deepPurpleAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(8.0),
                title: Center(
                    child: GradientText("Start Shortlisting Now",
                        gradient: LinearGradient(colors: [Colors.deepPurpleAccent, Colors.blueAccent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w700))),
                subtitle: Center(
                  child: Text(
                    "You can view all your shortlisted and contacted properties here.",
                    style: TextStyle(fontSize: 14.0, color: Colors.blueAccent),
                  ),
                )),
            GradientButton(
              callback: () => debugPrint("Pressed"),
              increaseHeightBy: 5.0,
              increaseWidthBy: 120.0,
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.deepPurpleAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              child: Text(
                "Start a New Search",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
