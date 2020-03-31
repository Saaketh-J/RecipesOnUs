import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterappexample/app_screens/ingredients_select.dart';




class work extends StatelessWidget {

  static final showGrid = false; // Set to false to show ListView

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
        body: Center(child: showGrid ? _buildGrid() : _buildList()),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
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

  // #docregion grid
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
                child: singleIngredient('images/bananas.jpg', 'bananas'),
              ),
            Container(
              child: singleIngredient('images/bread.jpg', 'bread'),
            ),
            Container(
              child: singleIngredient('images/butter.jpg', 'butter'),
            ),
            Container(
              child: singleIngredient('images/carrots.jpg', 'carrots'),
            ),
            Container(
              child: singleIngredient('images/cheese.jpg', 'cheese'),
            ),
            Container(
              child: singleIngredient('images/chicken.jpg', 'chicken'),
            ),
            Container(
              child: singleIngredient('images/jalapeno.jpg', 'jalapeno'),
            ),
            Container(
              child: singleIngredient('images/oil.jpg', 'oil'),
            ),
            Container(
              child: singleIngredient('images/pasta.jpg', 'pasta'),
            ),
            Container(
              child: singleIngredient('images/rice.jpg', 'rice'),
            ),
            Container(
              child: singleIngredient('images/salt.jpg', 'salt'),
            ),
            Container(
              child: singleIngredient('images/sugar.jpg', 'sugar'),
            ),
            Container(
              child: singleIngredient('images/Tofu_4.jpg', 'tofu'),
            ),
            Container(
              child: singleIngredient('images/tortilla.jpg', 'tortilla'),
            ),
          ],
        ),
      ),
    ],
  );
  // #enddocregion grid

  // #docregion list
  Widget _buildList() => ListView(
    children: [
      _tile('bananas', 'fruit', Icons.restaurant),
      _tile('bread', 'grain', Icons.restaurant),
      _tile('butter', 'carb', Icons.restaurant),
      _tile('carrots', 'vegetable', Icons.restaurant),
      _tile('cheese', 'milk',
          Icons.theaters),
      _tile('chicken', 'protien', Icons.restaurant),
      Divider(),
      _tile('jalapeno', 'vegetavle', Icons.restaurant),
      _tile('oil', 'basic food group', Icons.restaurant),
      _tile('pasta', 'carb', Icons.restaurant),
      _tile('rice', 'carb', Icons.restaurant),
      _tile('salt', 'nutrients', Icons.restaurant),
      _tile('sugar', 'confections', Icons.restaurant),
      _tile('tofu', 'protien', Icons.restaurant),
      _tile('tortilla', 'carb', Icons.restaurant),
    ],
  );

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.deepOrangeAccent[500],
    ),
  );
// #enddocregion list
}



class singleIngredient extends StatelessWidget {
  var ingredientImage;
  var ingredientName;

  singleIngredient(this.ingredientImage, this.ingredientName);

  @override
  Widget build(BuildContext context) {
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
    content: Text("$ingredientsList"),
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