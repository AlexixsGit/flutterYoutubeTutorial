import 'package:flutter/material.dart';
import 'package:youtube_tutorial_app/model/second_page_arguments.dart';
import 'package:youtube_tutorial_app/src/screens/folder-list.dart';

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
        child: Container(
          child: Column(
            children: [
              FolderList(1),
              FolderList(2),
              FolderList(3),
              RaisedButton(
                onPressed: () {
                  _showDialog(context);
                },
                child: Text('Show Options'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext scaffoldContext) {
    showDialog(
        context: scaffoldContext,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Select an option'),
            children: [
              ListTile(
                title: Text('Return home'),
                leading: Icon(Icons.keyboard_return),
                onTap: () => _showAlertDialog(context),
              ),
              ListTile(
                title: Text('Close'),
                leading: Icon(Icons.close),
                onTap: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  void _showAlertDialog(BuildContext showDialogContext) {
    showDialog(
        context: showDialogContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Question'),
            content: Text('Are you sure?'),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context), child: Text('No')),
              FlatButton(
                  onPressed: () => Navigator.popAndPushNamed(context, '/'),
                  child: Text('Yes'))
            ],
          );
        });
  }
}
