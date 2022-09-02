
 import 'package:flutter/material.dart';
import 'pages/bar.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => bar(),
     // '/details': (context) => Details(),

      },
    ),
  );
}