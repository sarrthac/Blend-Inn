import 'package:flutter/material.dart';
import 'wallpaper page.dart';

void main() => runApp(new MyApp());

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: wallP_Screen(),
      );
    }
  }




