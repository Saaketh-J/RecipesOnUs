import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterappexample/app_screens/home_page.dart';
import 'package:flutterappexample/app_screens/home_page2.dart';

class settingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Standard Ingredients',
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
           onPressed: () {},
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
           onPressed: () {},
           padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
         ),
       ],
     ),

    );
  }
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

