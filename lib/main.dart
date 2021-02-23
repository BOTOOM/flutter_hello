import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Hello Fluter App',
    home: new Material(
      color: Colors.deepPurple,
      child: Center(
        child: new Text(
          'Hello Flutter!',
          textDirection: TextDirection.ltr,
        ),
      ),
    ),
  ));
}
