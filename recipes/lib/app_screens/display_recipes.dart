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

List<Map<String, dynamic>> YlinkMap = [];
List<Map<String, dynamic>> YpicsMap = [];
List<Map<String, dynamic>> ElinkMap = [];
List<RaisedButton> dispYummly = new List<RaisedButton>();
List<RaisedButton> dispEpi = new List<RaisedButton>();

class main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    YummlyRecipes(context);
    //getEpiData();
    EpiRecipes(context);
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

Future<List<Widget>> YummlyRecipes(context) async {
  YlinkMap = await getYummlyData();
  for (int i = 0; i < 10; i++) {
    dispYummly.add(new RaisedButton(
      child: singleRecipe(YlinkMap[i].values.elementAt(0)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => webview(YlinkMap[i].values.elementAt(0),
                    YlinkMap[i].values.elementAt(1), 'Yummly')));
      },
    ));
  }
  return dispYummly;
}

Future<List<Widget>> EpiRecipes(context) async {
  print(ElinkMap);
  ElinkMap = await getEpiData();
  print(json.encode(ElinkMap));
  for (int i = 0; i < 10; i++) {
    dispEpi.add(new RaisedButton(
      child: singleRecipe(ElinkMap[i].values.elementAt(0)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => webview(ElinkMap[i].values.elementAt(0),
                    ElinkMap[i].values.elementAt(1), 'Epi')));
      },
    ));
  }
  return dispEpi;
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
                child: dispYummly[1],
              ),
              Container(
                child: dispYummly[2],
              ),
              Container(
                child: dispYummly[3],
              ),
              Container(
                child: dispEpi[4],
              ),
              Container(
                child: dispEpi[5],
              ),
              Container(
                child: dispEpi[6],
              ),
              Container(
                child: dispEpi[7],
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

  http.Response response = await http.get(website);
  dom.Document convertData = parse(response.body);

  var Ylinks = convertData.getElementsByTagName(
      ('div.card-info.primary-dark > a.card-title.p2-text.font-normal'));

  var Ypics = convertData.getElementsByTagName('img.recipe-card-img.full');

  for (var link in Ylinks) {
    YlinkMap.add({
      'title': link.text.trim(),
      'href': link.attributes['href'],
    });
  }

  for (var pic in Ypics) {
    YpicsMap.add({
      'img': pic.attributes['src'],
    });
  }

  //print(json.encode(YlinkMap));
  return YlinkMap;
}

Future getEpiData() async {
  print(globals.ingredientsList);
  String website = 'https://www.epicurious.com/search/?cuisine=' +
      globals.cuisineType.toLowerCase();
  if (globals.recipeType == 'Entree') {
    website = website + '&meal=lunch&content=recipe';
  } else {
    website = website +
        '&meal=' +
        globals.recipeType.toLowerCase() +
        '&content=recipe';
  }
  print(website);

  if (globals.ingredientsList.length > 0) {
    website = website + '&include=';

    for (String ingredient in globals.ingredientsList) {
      website =
          website + ingredient.replaceAll(' ', '%20').toLowerCase() + '%2C';
    }
    website = website.substring(0, website.length - 3);
  }

  print(website);
  http.Response response = await http.get(website);
  dom.Document convertData = parse(response.body);

  var Elinks = convertData.getElementsByTagName(
      ('div.results-group > article.recipe-content-card > a.view-complete-item'));

  for (var link in Elinks) {
    ElinkMap.add({
      'title': link.attributes['title'],
      'href': link.attributes['href'],
    });
  }

  print(json.encode(ElinkMap));
  print("hi");
  return ElinkMap;
}
