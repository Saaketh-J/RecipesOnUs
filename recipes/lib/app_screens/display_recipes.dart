import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/ingredients_select.dart';
import 'package:html/parser.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_app/app_screens/recipes_webview.dart';

List<Map<String, dynamic>> linkMap = [];

class main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    getYummlyData();
    YummlyRecipes(context);
    return FutureBuilder<Widget>(
        future: waiting(),
        builder: (context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return recipes();
          } else {
            return Container(
              decoration: BoxDecoration(color: Color(0xff000080)),
              child: Center(
                  child: SpinKitPouringHourglass(
                color: Colors.white,
                size: 80.0,
              )),
            );
          }
        });
  }
}

class fake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(width: 0.0, height: 0.0);
  }
}


class recipes extends StatelessWidget {
  Widget build(BuildContext context) {
//    return StatefulWrapper(
//      onInit: () {
//        _getThingsOnStartup().then((value) {
//          print('Async done');
//        });
//      },
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipes',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 30.0,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true, //default makes it in the middle
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(child: _buildGrid()),
    );
    //);
  }
}

// #docregion grid
List<RaisedButton> dispYummly = new List<RaisedButton>();

List<Widget> YummlyRecipes(context) {
  for (int i = 0; i < 10; i++) {
    dispYummly.add(new RaisedButton(
      child: singleRecipe(linkMap[i].values.elementAt(0)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => webview(linkMap[i].values.elementAt(0),
                    linkMap[i].values.elementAt(1))));
      },
    ));
  }
  return dispYummly;
}

Widget _buildGrid() => CustomScrollView(
  primary: false,
  slivers: <Widget>[
    SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            child: dispYummly[0],
          ),
          Container(
            child: singleRecipe(linkMap[1].values.elementAt(0)),
          ),
          Container(
            child: singleRecipe(linkMap[2].values.elementAt(0)),
          ),
        ],
      ),
    ),
  ],
);
/*
Widget _buildGrid(context) => Container(
  child: ListView.builder(
      itemCount: dispYummly.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: dispYummly[index],
        );
      }
  ),
);

 */
// #enddocregion grid

// #docregion list

// #enddocregion list

class singleRecipe extends StatelessWidget {
  //var recipeImage;
  var recipeName;

  //singleRecipe(this.recipeImage, this.recipeName);
  singleRecipe(this.recipeName);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      /*decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(recipeImage),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.8), BlendMode.dstATop),
        ),
      ),
      */
      child: Row(children: <Widget>[
        Flexible(
            child: Text(
          recipeName,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'CormorantGaramond-Light.ttf',
              fontSize: 20.0,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ))
      ]),
    );
  }
}

Future<Widget> waiting() =>
    // Imagine that this function is
// more complex and slow.
    Future.delayed(
      Duration(seconds: 7),
      () => fake(),
    );

Future getYummlyData() async {
  print(globals.ingredientsList);
  String website = 'https://www.yummly.com/recipes/' +
      globals.recipeType.toLowerCase() +
      '?';

  for (String ingredient in globals.ingredientsList) {
    website = website +
        '&allowedIngredient=' +
        ingredient.replaceAll(' ', '+').toLowerCase();
  }

  website = website +
      '&allowedCuisine=cuisine%5Ecuisine-' +
      globals.cuisineType.toLowerCase();

  website = website + '&q=' + globals.recipeType + '&taste-pref-appended=true';

  print(globals.recipeType);
  print(website);
  http.Response response = await http.get(website);
  dom.Document convertData = parse(response.body);

  var links = convertData.getElementsByTagName(
      ('div.card-info.primary-dark > a.card-title.p2-text.font-normal'));

  print(convertData
      .getElementsByTagName('a.result-title js-result-title')
      .length);

  for (var link in links) {
    linkMap.add({
      'title': link.text.trim(),
      'href': link.attributes['href'],
    });
  }
  print(json.encode(linkMap));
}
