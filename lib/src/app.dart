import 'package:flutter/material.dart';
import 'package:youtube_tutorial_app/src/screens/my_home_page.dart';
import 'package:youtube_tutorial_app/src/screens/second_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto Black'),
      initialRoute: '/',
      routes: {
        "/": (BuildContext context) => MyHomePage(),
        "/second": (BuildContext context) => SecondPage()
      },
    );
  }
}
