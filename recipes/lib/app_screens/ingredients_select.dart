import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappexample/app_screens/recipetype_select.dart';
import 'package:flutterappexample/globals.dart' as globals;

class ingredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globals.ingredientsList = new List<String>();
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              title: Text('Enter Main Ingredients:',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600),),
              centerTitle: true, //default makes it in the middle
              backgroundColor: Colors.white,
            ),
            body: Container(
              color: Color(0xC05000C),
              alignment: Alignment.center,
              child: ListView(children: <Widget>[
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
            )));
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
                  borderSide:
                  const BorderSide(color: Color(0xffED820E), width: 0.0),
                ),
                border: OutlineInputBorder(
                  //borderRadius: BorderRadius.circular(27.0),
                  //borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 0.0),
                )),
            onSubmitted: (var userInput) {
              setState(() {
                textBox = userInput;
                globals.ingredientsList.add(userInput.trim());
              });
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
            "Select Course",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontFamily: 'Garamond',
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 6.0,
          onPressed: () {
            selectCuisineType(context);
          },
        ));
  }
}

void selectCuisineType(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text("You gon Die"),
    content: Text("${globals.ingredientsList}"),
  );

  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return cuisineTypes();
      });
}