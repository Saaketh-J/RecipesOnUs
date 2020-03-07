import 'package:flutter/material.dart';

List<String> ingredientsList = List(0);

class ingredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          color: Colors.deepOrangeAccent,
          alignment: Alignment.center,
          child: ListView(children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Text(
                  "Enter Main Ingredients: ",
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Color(0xff000080),
                      fontFamily: 'CormorantGaramond',
                      fontWeight: FontWeight.w500),
                ),
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
            Container(
              child: NextScreen(),
            )
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
        margin: EdgeInsets.only(bottom: 20.0, right: 18.0, left: 18.0),
        child: TextField(
            style: TextStyle(
              height: 2.0,
              fontSize: 18.0,
            ),
            decoration: InputDecoration(
                hintText: 'Enter Ingredient',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.deepOrangeAccent, width: 0.0),
                ),
                border: OutlineInputBorder(
                    //borderRadius: BorderRadius.circular(27.0),
                    //borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 0.0),
                    )),
            onSubmitted: (var userInput) {
              setState(() {
                textBox = userInput;
              });
              ingredientsList.add(userInput);
            }),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.0, right: 70.0, left: 70.0),
        height: 50.0,
        child: RaisedButton(
            color: Colors.deepOrange,
            child: Text(
              "Select Cuisine",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Garamond',
                fontWeight: FontWeight.w600,
              ),
            ),
            elevation: 6.0,
            onPressed: () {
              //TODO
            }));
  }
}
