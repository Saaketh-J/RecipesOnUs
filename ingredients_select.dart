import 'package:flutter/material.dart';

class ingredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xff4A4C56),
      alignment: Alignment.center,
      child: Column(children: <Widget>[
        Container(
          margin:EdgeInsets.only(top: 40.0),
          child: Text(
            "Enter Ingredients: ",
            style:TextStyle(fontSize: 40.0, color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30.0),
        ),
        Container(
          child: TextBoxes(),
        ),
        Container(
          child: TextBoxes(),
        ),
        Container(
          child: TextBoxes(),
        ),
        Container(
          child: TextBoxes(),
        ),
        Container(
          child: TextBoxes(),
        ),
      ]),
    ));
  }
}

class TextBoxes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextBoxesState();
  }
}

class _TextBoxesState extends State<TextBoxes> {
  var textBox;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextField(
            decoration: InputDecoration(
                hintText: 'Enter Ingredient',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17.0),

                )),

            onSubmitted: (var userInput) {
              setState(() {
                textBox = userInput;
              });
            }),
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}
