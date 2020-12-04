import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/pantallas/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prenotazione Delivery',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPantalla(),
    );
  }
}
