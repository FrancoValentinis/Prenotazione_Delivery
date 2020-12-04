import 'package:flutter/material.dart';

class LoginPantalla extends StatefulWidget {
  @override
  _LoginPantallaState createState() => _LoginPantallaState();
}

class _LoginPantallaState extends State<LoginPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Image.asset("imagenes/login.jpg")
          ],
        ),
      ),
    );
  }
}
