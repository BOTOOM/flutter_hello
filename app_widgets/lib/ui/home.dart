import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 30.0, left: 10.0),
        color: Colors.deepOrangeAccent,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Margarita',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Tomate, Mozarela, Masa',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Marinara',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Tomate, Ajo',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
