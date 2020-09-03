import 'package:diseno/pages/header_page.dart';
import 'package:diseno/pages/manolo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños app',
      home: ManoloPage(),
    );
  }
}
