import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:rent_me/size_config.dart';
import 'package:rent_me/commons/theme.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_me/login_page.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text("My Profile"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: gradientColorBackground
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: SizeConfig.safeBlockVertical * 9,
              decoration: BoxDecoration(
                gradient: gradientColorBackground),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.white,),
                title: Text("Kamal Patra", style: TextStyle(color: Colors.white, fontSize: 25.0),),
                subtitle: Text("kpatra@google.com",style: TextStyle(color: Colors.white, fontSize: 15.0),),
              ),
            ),
            ListTile(
              title: Text("Account Settings", style: TextStyle(color: Colors.blueAccent)),
            ),
            ListTile(
              title: GradientText("Personal Information", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600), gradient: gradientColorText,),
              trailing: Icon(Icons.person, color: Colors.deepPurpleAccent,),),
            Divider(color: Colors.blueAccent,),
            ListTile(
              title: GradientText("Notifications", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600), gradient: gradientColorText,),
              trailing: Icon(Icons.notifications, color: Colors.deepPurpleAccent,),),
            Divider(color: Colors.blueAccent,),
            ListTile(
              title: Text("Support", style: TextStyle(color: Colors.blueAccent)),
            ),
            ListTile(
              title: GradientText("Get Help", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600), gradient: gradientColorText,),
              trailing: Icon(Icons.help, color: Colors.deepPurpleAccent,),),
            Divider(color: Colors.blueAccent,),
            ListTile(
              title: GradientText("Give us Feedback", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600), gradient: gradientColorText,),
              trailing: Icon(Icons.feedback, color: Colors.deepPurpleAccent,),),
            Divider(color: Colors.blueAccent,),
            ListTile(
              title: Text("Legal", style: TextStyle(color: Colors.blueAccent)),
            ),
            ListTile(
              title: GradientText("Terms of Service", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600), gradient: gradientColorText,),
              trailing: Icon(Icons.description, color: Colors.deepPurpleAccent,),),
            Divider(color: Colors.blueAccent,),
            ListTile(
              onTap: (){
                if(FirebaseAuth.instance.currentUser() != null){
                  FirebaseAuth.instance.signOut();
                }else{
                _googleSignIn.signOut();}
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              title: GradientText("Logout", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600), gradient: gradientColorText,),
              trailing: Icon(Icons.exit_to_app, color: Colors.deepPurpleAccent,),),
            Divider(color: Colors.blueAccent,),
            Center(
              child: GradientText("Version 1.0", gradient: gradientColorText,),
            )
          ],
        )
      )
    );
  }
}



//appBar: PreferredSize(
//preferredSize: Size.fromHeight(divHeight / 2 * 0.4),
//child: AppBar(
//automaticallyImplyLeading: false,
//flexibleSpace: Container(
//decoration: BoxDecoration(gradient: gradientColorBackground),
//child: Padding(
//padding: const EdgeInsets.only(top: 20.0, left: 8.0),
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.all(10.0),
//child: CircleAvatar(
//backgroundColor: Colors.transparent,
//radius: 35.0,
//child: ClipOval(
//child: SizedBox(
//child: Image.asset("images/face.png"),
//),
//),
//),
//),
//ListTile(
//title: Text(
//"Kamal",
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.w700,
//fontSize: 30.0),
//),
//subtitle: Text(
//"kamal.patra369@gmail.com",
//style: TextStyle(color: Colors.white),
//),
//),
//FlatButton(
//onPressed: () => debugPrint("Pressed"),
//child: Text(
//"View Profile",
//style: TextStyle(color: Colors.white),
//))
//]),
//),
//),
//),
//),

//Container(
//child: ListView(children: <Widget>[
//ListTile(
//title: GradientText(
//"Logout",
//gradient: gradientColorText,
//style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
//),
//trailing: Icon(
//Icons.exit_to_app,
//color: Colors.deepPurpleAccent,
//),
//onTap: ()=> Navigator.pushNamed(context, "/Login"),
//),
//]),
//),




// old home page design

//old home app bar design

//appBar: PreferredSize(
//preferredSize: Size.fromHeight(SizeConfig.safeBlockVertical * 15),
//child: AppBar(
//automaticallyImplyLeading: false,
//flexibleSpace: Container(
//decoration: BoxDecoration(
//gradient: gradientColorBackground),
//child: Column(
//mainAxisSize: MainAxisSize.max,
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.fromLTRB(20.0, 49.0, 20.0, 20.0),
//child: Container(
//height: 45.0,
//decoration: BoxDecoration(
//color: Colors.white,
//borderRadius: BorderRadius.circular(22.0)),
//child: Padding(
//padding: const EdgeInsets.symmetric(horizontal: 13.0),
//child: Row(children: <Widget>[
//Expanded(
//flex: 1,
//child: TextFormField(
//cursorColor: Colors.deepPurpleAccent,
//decoration: InputDecoration(
//border: InputBorder.none,
//hintText: "Search",
//hintStyle: TextStyle(color: Colors.blueAccent)
//),
//),
//),
//Icon(Icons.search, color: Colors.deepPurpleAccent,),
//]),
//)),
//),
//
//Text(
//"What can we help you find, Kamal?",
//style: TextStyle(
//fontSize: 20.0,
//fontWeight: FontWeight.w700,
//color: Colors.white),
//),
//],
//)),
//),
//),

//old body design

//SingleChildScrollView(
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start, children: <
//Widget>[
//Column(
//crossAxisAlignment: CrossAxisAlignment.start, children: <
//Widget>[
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: GradientText(
//"Select City",
//gradient: LinearGradient(
//colors: [Colors.deepPurpleAccent, Colors.blueAccent]),
//style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
//),
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Container(
//height: 75.0,
//child: ListView.builder(
//scrollDirection: Axis.horizontal,
//itemCount: cities.length,
//itemBuilder: (context, index) {
//return Padding(
//padding: const EdgeInsets.all(8.0),
//child: CircleAvatar(
//radius: 30.0,
//child: ClipOval(
//child: SizedBox(
//width: 100.0,
//height: 100.0,
//child: Image.asset(
//cities[index],
//fit: BoxFit.fill,
//)),
//),
//),
//);
//},
//),
//),
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: GradientText(
//"Why RentMe",
//gradient: LinearGradient(
//colors: [Colors.deepPurpleAccent, Colors.blueAccent]),
//style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
//),
//),
//Container(
//height: 400.0,
//child: GridView.count(
//crossAxisCount: 2,
//physics: NeverScrollableScrollPhysics(),
//children: <Widget>[
//Card(
//elevation: 0.0,
//child: Column(
//children: <Widget>[
//Image.asset("images/money.png"),
//Text("Save your Money: No brokerage fee")
//],
//),
//),
//Card(
//elevation: 0.0,
//child: Column(
//children: <Widget>[
//Image.asset("images/money.png"),
//Text("Save your Money: No brokerage fee")
//],
//),
//),
//Card(
//elevation: 0.0,
//child: Column(
//children: <Widget>[
//Image.asset("images/money.png"),
//Text("Save your Money: No brokerage fee")
//],
//),
//),
//Card(
//elevation: 0.0,
//child: Column(
//children: <Widget>[
//Image.asset("images/money.png"),
//Text("Save your Money: No brokerage fee")
//],
//),
//),
//],
//),
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: GradientText(
//"Collections",
//gradient: LinearGradient(
//colors: [Colors.deepPurpleAccent, Colors.blueAccent]),
//style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
//),
//),
//Container(
//height: 150.0,
//decoration:
//BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
//child: ListView.builder(
//scrollDirection: Axis.horizontal,
//itemCount: collectionsImages.length,
//itemBuilder: (context, index) {
//return Padding(
//padding: const EdgeInsets.symmetric(
//vertical: 8.0, horizontal: 8.0),
//child: Stack(
//alignment: Alignment.center,
//children: <Widget>[
//Card(
//elevation: 6.0,
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.circular(16.0)),
//child: ClipRRect(
//child: Image.asset(
//collectionsImages[index],
//fit: BoxFit.fill,
//),
//borderRadius: BorderRadius.circular(16.0),
//),
//),
//Text(
//collectionsText[index],
//style: cardTextStyle(),
//)
//]));
//}),
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: GradientText(
//"Find Properties for",
//gradient: LinearGradient(
//colors: [Colors.deepPurpleAccent, Colors.blueAccent]),
//style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
//),
//),
//Container(
//height: 150.0,
//decoration:
//BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
//child: ListView.builder(
//scrollDirection: Axis.horizontal,
//itemCount: collectionsImages.length,
//itemBuilder: (context, index) {
//return Padding(
//padding: const EdgeInsets.symmetric(
//vertical: 8.0, horizontal: 8.0),
//child: Stack(
//alignment: AlignmentDirectional.center,
//children: <Widget>[
//Card(
//elevation: 6.0,
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.circular(16.0)),
//child: ClipRRect(
//child: Image.asset(
//genresImages[index],
//fit: BoxFit.fill,
//),
//borderRadius: BorderRadius.circular(16.0),
//),
//),
//Text(
//genresText[index],
//style: cardTextStyle(),
//)
//]));
//}),
//),
//Container(
//decoration: BoxDecoration(
//gradient: LinearGradient(
//colors: [Colors.blueAccent, Colors.deepPurpleAccent],
//begin: Alignment.centerLeft,
//end: Alignment.centerRight)
//),
//child: Column(
//mainAxisSize: MainAxisSize.max,
//crossAxisAlignment: CrossAxisAlignment.stretch,
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text("List your property", style: cardTextStyle(),),
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text("Fill out a form and we will do the rest", style: cardTextStyle(),),
//),
//ListTile(
//leading: Icon(Icons.offline_pin, color: Colors.white,),
//title: Text("0 Brokerage Fee", style: TextStyle(color: Colors.white),),
//),
//ListTile(
//leading: Icon(Icons.offline_pin, color: Colors.white,),
//title: Text("Genuine Leads", style: TextStyle(color: Colors.white),),
//),
//ListTile(
//leading: Icon(Icons.offline_pin),
//title: Text("Unparalleled Convenience"),
//),
//Padding(
//padding: const EdgeInsets.only(right: 8.0,left: 230.0,bottom: 8.0),
//child: RaisedButton(onPressed: ()=> debugPrint("Post property pressed"),
//textColor: Colors.deepPurpleAccent,
//color: Colors.white,
//elevation: 5.0,
//padding: EdgeInsets.all(10.0),
//child: Text("Post Property Now"),),
//)
//
//],
//),
//),
//]),
//]),
//),
//);
//}
//}
//
//
//TextStyle cardTextStyle() {
//  return TextStyle(
//    fontSize: 20.0,
//    fontWeight: FontWeight.w800,
//    color: Colors.white,
//  );
//}