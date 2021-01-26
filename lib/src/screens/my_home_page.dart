import 'package:flutter/material.dart';
import 'package:youtube_tutorial_app/model/second_page_arguments.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController;
  TextEditingController lastnameController;

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
                        controller: nameController,
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
                        controller: lastnameController,
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
                        decoration: InputDecoration(labelText: 'Phone number'),
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
              ))),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('alexixsortizz@gmail.com'),
              accountName: Text('Alexis'),
              currentAccountPicture: FlutterLogo(),
              onDetailsPressed: () {},
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue, Colors.yellow],
                      end: Alignment.bottomRight)),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () => showHome(context),
            )
          ],
        ),
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.pushNamed(context, '/second',
          arguments: SecondPageArguments(
              name: this.nameController.text,
              lastname: this.lastnameController.text));
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
    this.nameController = TextEditingController();
    this.lastnameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    this.nameFocus.dispose();
    this.lastnameFocus.dispose();
    this.phoneNumberFocus.dispose();
    this.passwordFocus.dispose();
    this.btnShowSecondPageFocus.dispose();
    this.nameController.dispose();
    this.lastnameController.dispose();
  }

  void showHome(BuildContext context) {
    Navigator.pop(context);
  }
}
