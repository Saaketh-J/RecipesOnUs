import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterappexample/app_screens/home_page.dart';
import 'package:flutterappexample/app_screens/home_page2.dart';
import 'package:flutterappexample/app_screens/instructions.dart';

class settingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 30.0,
              fontWeight: FontWeight.w600),),
        centerTitle: true, //default makes it in the middle
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body:ListView(
        children: [
          FlatButton(child: Align(
            alignment: Alignment.topLeft,
            child:Text('Standard Ingredients',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.right,
            ),
          ),
            onPressed: () {
              changePage(context);
            },
            padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
          ),
          Divider(),
          FlatButton(child: Align(
            alignment: Alignment.topLeft,
            child:Text('App Instructions',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.right,
            ),
          ),
            onPressed: () {
             changeToInstructions(context);
            },
            padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
          ),
          Divider(),
          FlatButton(child: Align(
            alignment: Alignment.topLeft,
            child:Text('Favorite Recipes',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.right,
            ),
          ),
            onPressed: () {
              changeToFavorites(context);
            },
            padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
          ),
        ],
      ),

    );
  }
}


class favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 30.0,
              fontWeight: FontWeight.w600),),
        centerTitle: true, //default makes it in the middle
        backgroundColor: Colors.deepOrangeAccent,
      ),

    );
  }
}





void changeToFavorites(BuildContext context) {
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



void changePage(BuildContext context) {
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


void changeToInstructions(BuildContext context) {
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