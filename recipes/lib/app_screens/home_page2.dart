import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterappexample/app_screens/ingredients_select.dart';

var standardIngredientsList = new List<String>();

class standardIngredients extends StatefulWidget{
  @override
  work createState() => new work();
}


class work extends State<standardIngredients> {
  bool pressed1 = false;
  bool pressed2 = false;
  bool pressed3 = false;
  bool pressed4 = false;
  bool pressed5 = false;
  bool pressed6 = false;
  bool pressed7 = false;
  bool pressed8 = false;
  bool pressed9 = false;
  bool pressed10 = false;
  bool pressed11 = false;
  bool pressed12 = false;
  bool pressed13 = false;
  bool pressed14 = false;
  bool pressed15 = false;
  bool pressed16 = false;

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
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[

                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed1 ? removeIngredient('images/bananas.jpg', 'bananas') : singleIngredient('images/bananas.jpg', 'bananas'),
                  onPressed: () => setState(() => pressed1 = !pressed1),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed2 ? removeIngredient('images/bread.jpg', 'bread') : singleIngredient('images/bread.jpg', 'bread'),
                  onPressed: () => setState(() => pressed2 = !pressed2),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed3 ? removeIngredient('images/butter.jpg', 'butter') : singleIngredient('images/butter.jpg', 'butter'),
                  onPressed: () => setState(() => pressed3 = !pressed3),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed4 ? removeIngredient('images/carrots.jpg', 'carrots') : singleIngredient('images/carrots.jpg', 'carrots'),
                  onPressed: () => setState(() => pressed4 = !pressed4),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed5 ? removeIngredient('images/cheese.jpg', 'cheese') : singleIngredient('images/cheese.jpg', 'cheese'),
                  onPressed: () => setState(() => pressed5 = !pressed5),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed6 ? removeIngredient('images/eggs.jpg', 'eggs') : singleIngredient('images/eggs.jpg', 'eggs'),
                  onPressed: () => setState(() => pressed6 = !pressed6),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed7 ? removeIngredient('images/flour.jpg', 'flour') : singleIngredient('images/flour.jpg', 'flour'),
                  onPressed: () => setState(() => pressed7 = !pressed7),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed8 ? removeIngredient('images/jalapeno.jpg', 'jalapeno') : singleIngredient('images/jalapeno.jpg', 'jalapeno'),
                  onPressed: () => setState(() => pressed8 = !pressed8),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed9 ? removeIngredient('images/milk.jpg', 'milk') : singleIngredient('images/milk.jpg', 'milk'),
                  onPressed: () => setState(() => pressed9 = !pressed9),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed10 ? removeIngredient('images/oil.jpg', 'oil') : singleIngredient('images/oil.jpg', 'oil'),
                  onPressed: () => setState(() => pressed10 = !pressed10),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed11 ? removeIngredient('images/pasta.jpg', 'pasta') : singleIngredient('images/pasta.jpg', 'pasta'),
                  onPressed: () => setState(() => pressed11 = !pressed11),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed12 ? removeIngredient('images/pepper.jpg', 'black pepper') : singleIngredient('images/pepper.jpg', 'black peppper'),
                  onPressed: () => setState(() => pressed12 = !pressed12),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed13 ? removeIngredient('images/rice.jpg', 'rice') : singleIngredient('images/rice.jpg', 'rice'),
                  onPressed: () => setState(() => pressed13 = !pressed13),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed14 ? removeIngredient('images/salt.jpg', 'salt') : singleIngredient('images/salt.jpg', 'sugar'),
                  onPressed: () => setState(() => pressed14 = !pressed14),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed15 ? removeIngredient('images/sugar.jpg', 'sugar') : singleIngredient('images/sugar.jpg', 'sugar'),
                  onPressed: () => setState(() => pressed15 = !pressed15),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: pressed16 ? removeIngredient('images/tomato.jpeg', 'tomato') : singleIngredient('images/tomato.jpeg', 'tomato'),
                  onPressed: () => setState(() => pressed16 = !pressed16),
                ),

              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectCuisine(context);
        },
        child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 20),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}

  // #docregion grid
  // #enddocregion grid

class removeIngredient extends StatelessWidget {
  var ingredientImage;
  var ingredientName;
  removeIngredient(this.ingredientImage, this.ingredientName);
  @override
  Widget build(BuildContext context) {
    standardIngredientsList.add(ingredientName);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ingredientImage),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.3), BlendMode.dstATop),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Align(
                alignment: Alignment.bottomRight,
                child:Icon(
                  Icons.check,
                    color: Color(0xff000080),
                      size:50.0
                ),
            ),
          ),
        ],
      ),
    );
  }
}

class singleIngredient extends StatelessWidget {
  var ingredientImage;
  var ingredientName;

  singleIngredient(this.ingredientImage, this.ingredientName);

  @override
  Widget build(BuildContext context) {
    standardIngredientsList.remove(ingredientName);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ingredientImage),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.8), BlendMode.dstATop),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Align(
                alignment: Alignment.bottomRight,
                child:Text(
                  ingredientName,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'CormorantGaramond-Light.ttf',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.right,
                )),
          ),
        ],
      ),
    );
  }
}



void selectCuisine(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text("Please work"),
    content: Text("$standardIngredientsList"),
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
        return ingredients();
      });
}