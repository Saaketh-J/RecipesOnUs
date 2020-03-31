import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterappexample/app_screens/home_page2.dart';
import 'package:flutterappexample/app_screens/ingredients_select.dart';

var basicingredients = new List<String>();

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
    );
  }
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
            selectCuisine(context);
          },
        ));
  }
}


void selectCuisine(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text("You gon Die"),
    content: Text("$basicingredients"),
  );

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
        return work();
      });
}
