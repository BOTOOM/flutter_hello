import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.deepOrangeAccent,
      child: Text(
        'pizza',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
