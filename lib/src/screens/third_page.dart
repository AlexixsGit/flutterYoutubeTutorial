import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image list'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final url = 'https://picsum.photos/id/$index/400/300';
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/fourthPage', arguments: url);
              },
              child: Card(
                  child: FadeInImage(
                image: NetworkImage(url),
                placeholder: AssetImage('assets/giphy.gif'),
                height: 300,
              )));
        },
        itemCount: 50,
      ),
    );
  }
}
