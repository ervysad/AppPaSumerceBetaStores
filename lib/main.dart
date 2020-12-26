import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Gauth.dart';

import 'package:hello_world_vs/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Hecho Pa´ Sumerce',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{},
      home: new LoginPage(),
    );
  }
}
