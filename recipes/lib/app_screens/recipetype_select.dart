import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappexample/app_screens/cuisine_select.dart';
import 'package:flutterappexample/app_screens/home_page.dart';
import 'package:flutterappexample/globals.dart' as globals;

var cuisineSelect;

class cuisineTypes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globals.recipeType = "";
    theme:
    ThemeData(
        accentColor: Colors.yellow,
        primaryColor: Colors.black,
        fontFamily: 'CormorantGaramond',
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 100.0, fontWeight: FontWeight.w800),
        ));

    return Container(
      padding:
      EdgeInsets.only(bottom: 240.0, left: 15.0, right: 15.0, top: 160.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Select Course:',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 50.0,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.right,
                  ),
                  RaisedButton(
                    child: cuisine('images/Appetizer.jpg', 'Appetizer'),
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20) ,
                    onPressed: () {
                    selectCuisine(context);
                  },
                  ),
                  RaisedButton(
                    child: cuisine('images/Entree.jpg', 'Entree'),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 20) ,
                    onPressed: () {
                      selectCuisine(context);
                    },
                  ),
                  RaisedButton(
                    child: cuisine('images/Dessert.jpg', 'Dessert'),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 15) ,
                    onPressed: () {
                      selectCuisine(context);
                    },
                  ),

                ]),
          ),
      ),);
  }
}

class cuisine extends StatelessWidget {
  var cuisineImage;
  var cuisineType;

  cuisine(this.cuisineImage, this.cuisineType);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      height: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(cuisineImage),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.7), BlendMode.dstATop),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              child: FlatButton(
                child: Text(
                  cuisineType,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 40.0,
                      shadows: [
                        Shadow(
                          // bottomLeft
                            offset: Offset(-.5, -.5),
                            color: Colors.white),
                        Shadow(
                          // bottomRight
                            offset: Offset(.5, -.5),
                            color: Colors.white),
                        Shadow(
                          // topRight
                            offset: Offset(.5, .5),
                            color: Colors.white),
                        Shadow(
                          // topLeft
                            offset: Offset(-.5, .5),
                            color: Colors.white),
                      ],
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  print(cuisineType);
                  globals.recipeType = cuisineType;
                  print(globals.recipeType);
                  return selectCuisine(context);
                },)),
        ],
      ),
    );
  }
}

void selectCuisine(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations
          .of(context)
          .modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return cuisines();
      });
}