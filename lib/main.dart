import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Hello Fluter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Title in app bar  '),
        ),
        body: Material(
          color: Colors.deepPurple,
          child: Center(
            child: new Text(
              'Hello Flutter!',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.white, fontSize: 36.0),
            ),
          ),
        ),
      )));
}
