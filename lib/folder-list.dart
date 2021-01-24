import 'package:flutter/material.dart';

class FolderList extends StatefulWidget {
  final int folderNumber;

  FolderList(this.folderNumber);

  @override
  State<StatefulWidget> createState() => _FolderState(folderNumber);
}

class _FolderState extends State<FolderList> {
  int folderNumber;
  var listIcon = Icons.folder;
  var checkboxValue = false;

  _FolderState(this.folderNumber);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          listIcon,
          color: Colors.red,
        ),
        Text('File number  ${this.folderNumber}'),
        Checkbox(
          activeColor: Colors.green,
          checkColor: Colors.white,
          focusColor: Colors.red,
          value: checkboxValue,
          onChanged: (bool value) {
            setState(() {
              checkboxValue = value;
            });
            _changeIcon();
          },
        )
      ],
    );
  }

  void _changeIcon() {
    if (checkboxValue) {
      this.listIcon = Icons.check;
    } else {
      this.listIcon = Icons.folder;
    }
  }
}
