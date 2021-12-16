// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class NewEntry extends StatefulWidget {
  final Function addEntry;

  NewEntry(this.addEntry);

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  final tInput = TextEditingController();

  final aInput = TextEditingController();

  void sendEntry() {
    final tI = tInput.text;
    final aI = double.parse(aInput.text);

    if (tI.isEmpty || aI <= 0) {
      print ('value incomplete');
      return;
    }

    widget.addEntry(tI, aI);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Entry Title'),
              controller: tInput,
              onSubmitted: (_) => sendEntry(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount of Entry'),
              controller: aInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => sendEntry(),
            ),
            TextButton(
              child: Text(
                'Add New Transaction',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              onPressed: sendEntry,
            )
          ],
        ),
      ),
    );
  }
}
