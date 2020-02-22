import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.deepPurpleAccent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
        ),
        title: Text("Messages"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GradientText(
              "Messages will appear here.", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              gradient: LinearGradient(
                  colors: [Colors.deepPurpleAccent, Colors.blueAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),),
          ),
        ),
      ),
    );
  }
}
