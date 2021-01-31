import 'package:flutter/material.dart';
import 'package:youtube_tutorial_app/src/screens/fifth_page.dart';
import 'package:youtube_tutorial_app/src/screens/fourth_page.dart';
import 'package:youtube_tutorial_app/src/screens/my_home_page.dart';
import 'package:youtube_tutorial_app/src/screens/second_page.dart';
import 'package:youtube_tutorial_app/src/screens/third_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto Black'),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MyHomePage(),
        '/second': (BuildContext context) => SecondPage(),
        '/thirdPage': (BuildContext context) => ThirdPage(),
        '/fourthPage': (BuildContext context) => FourthPage(),
        '/fifthPage': (BuildContext context) => FifthPage()
      },
    );
  }
}
