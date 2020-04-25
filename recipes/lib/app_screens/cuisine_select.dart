import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappexample/app_screens/display_recipes.dart';
import 'package:flutterappexample/globals.dart' as globals;

var cuisineSelect;

class cuisines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globals.cuisineType = "";
    theme:
    ThemeData(
        accentColor: Colors.yellow,
        primaryColor: Colors.black,
        fontFamily: 'CormorantGaramond',
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 100.0, fontWeight: FontWeight.w800),
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Cuisines',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 50.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            decoration: TextDecoration.none,
          )),
        centerTitle: true, //default makes it in the middle
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: Color(0xC05000C),
        child: ListView(children: <Widget>[
          Center(
              /*child: Text("Cuisine",
                  style: TextStyle(
                    fontFamily: 'CormorantGaramond',
                    fontSize: 60.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ))*/),
          cuisine('images/American.jpg', 'American'),
          cuisine('images/Asian_Fusion.jpg', 'Asian'),
          cuisine('images/Italian.jpg', 'Italian'),
          cuisine('images/Indian.jpg', 'Indian'),
          cuisine('images/Mexican.jpg', 'Mexican'),
          cuisine('images/Thai.jpg', 'Thai'),
          //cuisine('images/Vietnamese.jpg', 'Vietnamese'),
          //cuisine('images/african.jp', 'African'),
          cuisine('images/Turkish.jpg', 'Hungarian'),
          cuisine('images/Greek.jpg', 'Greek'),
          //cuisine('images/Korean.jpg', 'Korean'),
        ]),
      ),
    );
  }
}

class cuisine extends StatelessWidget {
  var cuisineImage;
  var cuisineName;

  cuisine(this.cuisineImage, this.cuisineName);

  bool pressed = false;
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
                cuisineName,
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
                globals.cuisineType = cuisineName;
                showRecipes(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

void showRecipes(BuildContext context) {
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
        return main();
      });
}