import 'package:flutter/material.dart';
import 'package:youtube_tutorial_app/model/second_page_arguments.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SecondPageArguments secondPageArguments =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Welcome ${secondPageArguments.name}  ${secondPageArguments.lastname}'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _returnHomePage(context);
          },
          child: Text('Return to home'),
        ),
      ),
    );
  }

  void _returnHomePage(BuildContext context) {
    Navigator.pop(context);
  }
}
