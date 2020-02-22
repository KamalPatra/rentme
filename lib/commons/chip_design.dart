import 'package:flutter/material.dart';

class ChoiceChips extends StatefulWidget {
  final List<String> chipName;

    ChoiceChips({Key key, this.chipName}) : super(key: key);


  @override
  _ChoiceChipsState createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  String _isSelected = "";

  _buildChoiceList(){
    List<Widget> choices =  List();
    widget.chipName.forEach((item){
      choices.add(Container(
        child: ChoiceChip(
          label: Text(item),
           labelStyle: TextStyle(color: Colors.white),
          selectedColor: Colors.pinkAccent,
          backgroundColor: Colors.deepPurpleAccent,
          selected: _isSelected == item,
          onSelected: (selected){
            setState(() {
              _isSelected = item;
            });
          },
        ),
      ));
    });
    return choices;
  }
  @override
  Widget build(BuildContext context){
    return Wrap(
      spacing: 5.0,
      runSpacing: 3.0,
      children:
        _buildChoiceList(),
    );
  }
}
