import 'package:flutter/material.dart';
import 'package:youtube_tutorial_app/model/second_page_arguments.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameTextController;
  TextEditingController lastnameController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form fields Implementation without form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: nameTextController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Lastname'),
                controller: lastnameController,
              ),
              RaisedButton(
                onPressed: () {
                  _showSecondPage(context);
                },
                child: Text('Show second page'),
              )
            ],
          ),
        ));
  }

  void _showSecondPage(BuildContext context) {
    Navigator.pushNamed(context, '/second',
        arguments: SecondPageArguments(
            name: this.nameTextController.text,
            lastname: this.lastnameController.text));
  }

  @override
  void initState() {
    super.initState();
    this.lastnameController = TextEditingController();
    this.nameTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    this.lastnameController.dispose();
    this.nameTextController.dispose();
  }
}
