import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$index/400/300'),
            placeholder: AssetImage('assets/giphy.gif'),
            height: 300,
          ));
        },
        itemCount: 50,
      ),
    );
  }
}
