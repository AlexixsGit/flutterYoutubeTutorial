import 'package:flutter/material.dart';
import 'package:youtube_tutorial_app/model/second_page_arguments.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nameValue;
  String lastnameValue;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form fields Implementation with form'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) {
                      nameValue = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'The name cannot be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Lastname'),
                    onSaved: (value) {
                      lastnameValue = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'The lastname cannot be empty';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Phone number'),
                    onSaved: (value) {
                      print(value);
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    onSaved: (value) {
                      print(value);
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      _showSecondPage(context);
                    },
                    child: Text('Show second page'),
                  )
                ],
              ),
            )));
  }

  void _showSecondPage(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.pushNamed(context, '/second',
          arguments: SecondPageArguments(
              name: this.nameValue, lastname: this.lastnameValue));
    }
  }
}
