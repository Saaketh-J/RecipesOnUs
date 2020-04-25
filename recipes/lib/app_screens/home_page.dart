import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterappexample/app_screens/home_page2.dart';
import 'package:flutterappexample/app_screens/settingsPage.dart';
import 'package:flutterappexample/app_screens/instructions.dart';


class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/joyce-romero-FP1nAPbqipw-unsplash.jpg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 130.0),
              child: Text(
                'Reversing',
                style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.deepOrange,
                    fontFamily: 'Roboto',
                    fontSize: 100.0,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin:EdgeInsets.only(left: 55, top: 20),
              child: Text(
                'Recipes',
                style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.deepOrange,
                    fontFamily: 'Roboto',
                    fontSize: 100.0,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: FindCuisine(),
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          settingsPage1(context);
        },
        child: Icon(
            Icons.settings,
            color: Colors.white,
            size: 27),
        backgroundColor: Colors.deepOrange,
      ),*/
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff072f5f),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info_outline, color: Colors.white),
              onPressed: () {
                instructions1(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.grid_on, color: Colors.white),
              onPressed: () {
                nextPage(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite, color: Colors.white),//Icons.grade gives a star
              onPressed: () {
                favorites1(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                settingsPage1(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}


void settingsPage1(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation) {
        return settingsPage();
      });
}


void instructions1(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation) {
        return instructions_HomePage();
      });
}



void favorites1(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation) {
        return favorites();
      });
}





class FindCuisine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only( top: 250),
        //height: 50.0,
        child: RaisedButton(
          color: Colors.deepOrangeAccent,
          child: Text(
              'Find Recipes',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 40,
                color: Color(0xff000080),
              )
          ),
          elevation: 6.0,
          onPressed: (){
            nextPage(context);
          },
        ));
  }
}


void nextPage(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation) {
        return standardIngredients();
      });
}