import 'package:flutter/material.dart';
import 'package:youtube_tutorial_app/model/second_page_arguments.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nameValue;
  String lastnameValue;

  FocusNode nameFocus;
  FocusNode lastnameFocus;
  FocusNode phoneNumberFocus;
  FocusNode passwordFocus;
  FocusNode btnShowSecondPageFocus;

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
                child: ListView(
                  children: [
                    Column(
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
                          focusNode: nameFocus,
                          onEditingComplete: () =>
                              requestFocus(context, this.lastnameFocus),
                          textInputAction: TextInputAction.next,
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
                          focusNode: lastnameFocus,
                          onEditingComplete: () =>
                              requestFocus(context, phoneNumberFocus),
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(labelText: 'Phone number'),
                          onSaved: (value) {
                            print(value);
                          },
                          focusNode: phoneNumberFocus,
                          onEditingComplete: () =>
                              requestFocus(context, passwordFocus),
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Password'),
                          onSaved: (value) {
                            print(value);
                          },
                          focusNode: passwordFocus,
                        ),
                        RaisedButton(
                          onPressed: () {
                            _showSecondPage(context);
                          },
                          focusNode: btnShowSecondPageFocus,
                          child: Text('Show second page'),
                        )
                      ],
                    ),
                  ],
                ))));
  }

  void _showSecondPage(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.pushNamed(context, '/second',
          arguments: SecondPageArguments(
              name: this.nameValue, lastname: this.lastnameValue));
    }
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  void initState() {
    super.initState();
    this.nameFocus = FocusNode();
    this.lastnameFocus = FocusNode();
    this.phoneNumberFocus = FocusNode();
    this.passwordFocus = FocusNode();
    this.btnShowSecondPageFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    this.nameFocus.dispose();
    this.lastnameFocus.dispose();
    this.phoneNumberFocus.dispose();
    this.passwordFocus.dispose();
    this.btnShowSecondPageFocus.dispose();
  }
}
