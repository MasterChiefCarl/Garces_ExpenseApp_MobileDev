// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'model/model_e.dart';
import 'widgets/add_entry.dart';
import 'widgets/list_entry.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Entry> _userEntries = [
    Entry(id: '001', title: 'Shoes', amount: 3500.00, date: DateTime.now()),
    Entry(
        id: '002',
        title: 'Bought Xbox One',
        amount: 12000.00,
        date: DateTime.now())
  ];

  void _addNewEntry(String title, double amount) {
    final newEntry = Entry(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userEntries.add(newEntry);
    });
  }

  void _startaddNewEntry(BuildContext ce) {
    showModalBottomSheet(
      context: ce,
      builder: (_) {
        return GestureDetector(
          onTap:(){},
          child: NewEntry(_addNewEntry),
          behavior:HitTestBehavior.opaque,
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garces Flutter App'),
        actions: <Widget>[IconButton(onPressed: ()=> _startaddNewEntry(context), icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            EntryList(_userEntries),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> _startaddNewEntry(context),
      ),
    );
  }
}
