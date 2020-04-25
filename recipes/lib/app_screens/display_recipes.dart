import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappexample/app_screens/ingredients_select.dart';
import 'package:html/parser.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:flutterappexample/globals.dart' as globals;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterappexample/app_screens/recipes_webview.dart';

List<Map<String, dynamic>> YlinkMap = [];
List<Map<String, dynamic>> YpicsMap = [];
List<Map<String, dynamic>> ElinkMap = [];
List<Map<String, dynamic>> FlinkMap = [];
List<RaisedButton> dispYummly = new List<RaisedButton>();
List<RaisedButton> dispEpi = new List<RaisedButton>();
List<RaisedButton> disp52 = new List<RaisedButton>();

class main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    YummlyRecipes(context);
    EpiRecipes(context);
    F52Recipes(context);
    return FutureBuilder<Widget>(
        future: waiting(),
        builder: (context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return recipes();
          } else {
            return Container(
              decoration: BoxDecoration(color: Color(0xff072f5f)),
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
      body: Center(child: _buildGrid(context)),
    );
    //);
  }
}

// #docregion grid

Future<List<Widget>> YummlyRecipes(context) async {
  YlinkMap = await getYummlyData();
  for (int i = 0; i < YlinkMap.length; i++) {
    if (i > 10) {
      break;
    }
    dispYummly.add(new RaisedButton(
      color: Color(0xff072f5f),
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
  ElinkMap = await getEpiData();
  for (int i = 0; i < ElinkMap.length; i++) {
    if (i > 10) {
      break;
    }
    dispEpi.add(new RaisedButton(
      color: Color(0xff072f5f),
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

Future<List<Widget>> F52Recipes(context) async {
  FlinkMap = await get52Data();
  for (int i = 0; i < FlinkMap.length; i++) {
    if (i > 10) {
      break;
    }
    disp52.add(new RaisedButton(
      color: Color(0xff072f5f),
      child: singleRecipe(FlinkMap[i].values.elementAt(0)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => webview(FlinkMap[i].values.elementAt(0),
                    FlinkMap[i].values.elementAt(1), 'F52')));
      },
    ));
  }
  return disp52;
}


Widget _buildGrid(context) => Scaffold(
    bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
            child: FlatButton(
              child: Text("Restart",
                  style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              ),
              onPressed: () {
                dispYummly = new List<RaisedButton>();
                dispEpi = new List<RaisedButton>();
                disp52 = new List<RaisedButton>();
                ElinkMap = [];
                YlinkMap = [];
                FlinkMap = [];
                goToIngredients(context);
              },
            ))),
    body: CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: compile())),
      ],
    ));

List<Widget> compile() {
  var masterList = List<Widget>();
  masterList = List.generate((dispYummly.length) ~/ 2, (index) {
    return dispYummly[index];
  });
  masterList += List.generate((dispEpi.length) ~/ 2, (index) {
    return dispEpi[index];
  });
  masterList += List.generate((disp52.length) ~/ 2, (index) {
    return disp52[index];
  });
  masterList += List.generate((dispYummly.length) ~/ 2, (index) {
    return dispYummly[index + dispYummly.length ~/ 2];
  });
  return masterList;
}

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
                  color: Colors.white,
                  fontFamily: 'CormorantGaramond-Light.ttf',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
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

  if (globals.ingredientsList.length > 0) {
    website = website + '&include=';

    for (String ingredient in globals.ingredientsList) {
      website =
          website + ingredient.replaceAll(' ', '%20').toLowerCase() + '%2C';
    }
    website = website.substring(0, website.length - 3);
  }

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

  return ElinkMap;
}

Future get52Data() async {
  String website = 'https://food52.com/recipes/search?q=';

  if (globals.ingredientsList.length > 0) {
    for (String ingredient in globals.ingredientsList) {
      website = website + ingredient.replaceAll(' ', '+').toLowerCase() + '+';
    }
    website = website +
        globals.cuisineType.toLowerCase() +
        '&tag=' +
        globals.recipeType.toLowerCase();
  }
  else{
    website = website +
        globals.cuisineType.toLowerCase() +
        '&tag=' +
        globals.recipeType.toLowerCase();
  }

  print(website);
  http.Response response = await http.get(website);
  dom.Document convertData = parse(response.body);

  var Flinks = convertData.getElementsByTagName(('h3 > a'));

  for (var link in Flinks) {
    FlinkMap.add({
      'title': link.attributes['title'],
      'href': link.attributes['href'],
    });
  }

  print(json.encode(FlinkMap));
  print("hi");
  return FlinkMap;
}

void goToIngredients(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return ingredients();
      });
}