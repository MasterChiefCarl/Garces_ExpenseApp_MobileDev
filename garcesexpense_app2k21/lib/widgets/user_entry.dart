// ignore_for_file: prefer_const_constructors, unused_field

import "package:flutter/material.dart";
import '../model/model_e.dart';

import 'add_entry.dart';

class UserEntries extends StatefulWidget {
  const UserEntries({Key? key}) : super(key: key);

  @override
  _UserEntriesState createState() => _UserEntriesState();
}

class _UserEntriesState extends State<UserEntries> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewEntry(_addNewEntry),

      ],
    );
  }
}
