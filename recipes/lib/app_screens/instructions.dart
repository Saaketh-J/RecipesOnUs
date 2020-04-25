import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterappexample/app_screens/home_page.dart';
import 'package:flutterappexample/app_screens/settingsPage.dart';

class instructions_HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('images/page1.jpg'),
            fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
           Colors.black.withOpacity(0.7), BlendMode.dstATop),
           ),
           ),
                         child: Align(
                     alignment: Alignment.center,
                      child:Container(
                        width: 230,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xff072f5f),
                        ),
                        child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                           Text(
                               'Part1:',
                              style: TextStyle(
                             color: Colors.white,
                             fontFamily: 'Roboto',
                            fontSize: 30.0,
                             fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                        ),

                           Text(
                            'Click Find Recipes to begin! ',
                             style: TextStyle(
                             color: Colors.white,
                             fontFamily: 'Roboto',
                              fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                        ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                                  FlatButton(
                                      child: Align(
                                           alignment: Alignment.center,
                                          child:Text(' Skip',
                                           style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto',
                                          fontSize: 15,
                                           color: Colors.white,
                                       ),
                                     textAlign: TextAlign.right,
                                      ),
                                    ),
                                      onPressed: () {
                                        goToHomePage(context);
                                     },
                             padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
                             ),
                                FlatButton(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child:Text('Got it!',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Roboto',
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  onPressed: () {
                                    changePage(context);
                                  },
                                  padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
                                ),
                            ],
                            ),
            ],
         ),
                      ),
        ),
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
        return instructions_Page2();
      });
}

void goToHomePage(BuildContext context) {
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
        return homePage();
      });
}

class instructions_Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/page2.jpg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child:Container(
            width: 230,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xff072f5f),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Part2:',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),

                Text(
                  'Click tiles to select ingredients automatically included ',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    FlatButton(
                      child: Align(
                        alignment: Alignment.center,
                        child:Text(' Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      onPressed: () {
                        goToHomePage(context);
                      },
                      padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
                    ),
                    FlatButton(
                      child: Align(
                        alignment: Alignment.center,
                        child:Text('Got it!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        changePage2(context);
                      },
                      padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void changePage2(BuildContext context) {
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
        return instructions_Page3();
      });
}

class instructions_Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/page3.jpg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child:Container(
            width: 240,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xff072f5f),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Part3:',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),

                Text(
                  'Type ingredients you want to use',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    FlatButton(
                      child: Align(
                        alignment: Alignment.center,
                        child:Text(' Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      onPressed: () {
                        goToHomePage(context);
                      },
                      padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
                    ),
                    FlatButton(
                      child: Align(
                        alignment: Alignment.center,
                        child:Text('Got it!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        changePage3(context);
                      },
                      padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void changePage3(BuildContext context) {
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
        return instructions_Page4();
      });
}

class instructions_Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/page4.jpg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child:Container(
            width: 260,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xff072f5f),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Part4:',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),

                Text(
                  'Select the course of the dish you want to make',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    FlatButton(
                      child: Align(
                        alignment: Alignment.center,
                        child:Text(' Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      onPressed: () {
                        goToHomePage(context);
                      },
                      padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
                    ),
                    FlatButton(
                      child: Align(
                        alignment: Alignment.center,
                        child:Text('Got it!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        changePage4(context);
                      },
                      padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void changePage4(BuildContext context) {
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
        return instructions_Page5();
      });
}

class instructions_Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/page5.jpg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child:Container(
            width: 250,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xff072f5f),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Part5:',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),

                Text(
                  'Select the cuisine type of your dish',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    FlatButton(
                      child: Align(
                        alignment: Alignment.center,
                        child:Text(' Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      onPressed: () {
                        goToHomePage(context);
                      },
                      padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
                    ),
                    FlatButton(
                      child: Align(
                        alignment: Alignment.center,
                        child:Text('Got it!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        changePage5(context);
                      },
                      padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void changePage5(BuildContext context) {
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
        return instructions_Page6();
      });
}
class instructions_Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/page6.jpg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child:Container(
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xff072f5f),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Part6:',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),

                Text(
                  'Select one of these recipes and you\'re ready to use your ingregients',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    FlatButton(
                      child: Align(
                        alignment: Alignment.center,
                        child:Text('Got it!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      onPressed: () {
                        goToHomePage(context);
                      },
                      padding: EdgeInsets.symmetric(vertical:15, horizontal: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

