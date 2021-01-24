import 'package:flutter/material.dart';

class ButtonTutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RaisedButton(
            onPressed: () => print('Pressing the button'),
            child: Text('RaisedButton'),
            color: Colors.green,
          ),
          FlatButton(
            onPressed: () => print('Flatbutton'),
            child: Text('FlatButton'),
            color: Colors.red,
          ),
          IconButton(
              icon: Icon(Icons.alarm), onPressed: () => print('Icon button')),
          OutlineButton(
            child: Text(
              'OutlineButton',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => print('outlineButton'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            borderSide: BorderSide(color: Colors.red, width: 3),
          )
        ],
      ),
    );
  }
}
