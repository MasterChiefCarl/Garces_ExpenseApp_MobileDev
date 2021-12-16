// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:garcesexpense_app2k21/model/model_e.dart';
import 'package:intl/intl.dart';

class EntryList extends StatelessWidget {
  final List<Entry> entries;
  EntryList(this.entries);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height:550,
      child: ListView.builder(
        itemBuilder: (cx,index){
          return Card(
            elevation: 5,
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      '\u20B1${entries[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 3,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(entries[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        Text(DateFormat.yMMMd().format(entries[index].date),
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ])
                ],
              ),
            ),
          );
        },
        itemCount: entries.length,
      ),
    );
  }
}
