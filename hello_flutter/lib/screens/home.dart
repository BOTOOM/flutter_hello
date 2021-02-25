import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurple,
      child: Center(
        child: new Text(
          sayHello(),
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white, fontSize: 36.0),
        ),
      ),
    );
  }

  String sayHello() {
    String hello;
    DateTime now = new DateTime.now();
    if (now.hour < 12) {
      hello = 'Buenos dias';
    } else if (now.hour > 18) {
      hello = 'Buenas noches';
    } else {
      hello = 'Buenas Tardes';
    }

    return 'La hora es: ' +
        now.hour.toString() +
        ':' +
        now.minute.toString() +
        '\n' +
        hello;
  }
}
