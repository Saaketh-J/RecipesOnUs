import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class webview extends StatelessWidget {
  var recipeUrl;
  var name;

  webview(this.name, this.recipeUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
}
