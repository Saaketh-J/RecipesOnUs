import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


var cuisineSelect;

class cuisines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    theme:
    ThemeData(
        accentColor: Colors.yellow,
        primaryColor: Colors.black,
        fontFamily: 'CormorantGaramond',
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 100.0, fontWeight: FontWeight.w800),
        ));

    return Scaffold(
      body: Center(
          child: ListView(children: <Widget>[
            Center(
                child: Text("Cuisine",
                    style: TextStyle(
                      fontFamily: 'CormorantGaramond',
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ))),
            cuisine('images/Appetizer.jpg', 'Appetizer'),
            cuisine('images/Entree.jpg', 'Entree'),
            cuisine('images/Dessert.jpg', 'Dessert'),
            cuisine('images/American.jpg', 'American'),
            cuisine('images/Asian_Fusion.jpg', 'Asian Fusion'),
            cuisine('images/Italian.jpg', 'Italian'),
            cuisine('images/Indian.jpg', 'Indian'),
            cuisine('images/Mexican.jpg', 'Mexican'),
            cuisine('images/Thai.jpg', 'Thai'),
            cuisine('images/Vietnamese.jpg', 'Vietnamese'),
            cuisine('images/african.jpg', 'African'),
            cuisine('images/Turkish.jpg', 'Turkish'),
            cuisine('images/Greek.jpg', 'Greek'),
            cuisine('images/Korean.jpg', 'Korean'),
          ]),
        ),
    );
  }
}

class cuisine extends StatelessWidget {
  var cuisineImage;
  var cuisineName;

  cuisine(this.cuisineImage, this.cuisineName);

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
              child: Text(
                cuisineName,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 40.0,
                    shadows: [
                      Shadow( // bottomLeft
                          offset: Offset(-1.5, -1.5),
                          color: Colors.white
                      ),
                      Shadow( // bottomRight
                          offset: Offset(1.5, -1.5),
                          color: Colors.white
                      ),
                      Shadow( // topRight
                          offset: Offset(1.5, 1.5),
                          color: Colors.white
                      ),
                      Shadow( // topLeft
                          offset: Offset(-1.5, 1.5),
                          color: Colors.white
                      ),
                    ],
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,

              )),
        ],
      ),
    );
  }
}