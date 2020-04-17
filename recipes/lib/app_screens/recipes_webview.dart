import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class webview extends StatelessWidget {
  var recipeUrl;
  var name;
  var website;

  webview(this.name, this.recipeUrl, this.website);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(website == 'Yummly') {
      return new Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: Center(
          child: WebviewScaffold(
            url: 'https:/yummly.com' + recipeUrl,
            withZoom: true,
            withLocalStorage: false,
          ),
        ),
      );
    }
    if(website == 'Epi') {
      return new Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: Center(
          child: WebviewScaffold(
            url: 'https://www.epicurious.com' + recipeUrl,
            withZoom: true,
            withLocalStorage: false,
          ),
        ),
      );
    }
  }
}