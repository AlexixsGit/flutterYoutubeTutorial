import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Image view'),
      ),
      body: Center(
        child: Hero(
          tag: url,
          child: FadeInImage(
              image: NetworkImage(url),
              placeholder: AssetImage('assets/giphy.gif')),
        ),
      ),
    );
  }
}
