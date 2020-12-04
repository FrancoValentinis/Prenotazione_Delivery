import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/ayudas/colores.dart';
import 'package:prenotazione_delivery/src/models/productos.dart';

class Detalles extends StatefulWidget {
  final Productos productos;

  Detalles({@required this.productos});

  @override
  _DetallesState createState() => _DetallesState();
}

class _DetallesState extends State<Detalles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Text(
              widget.productos.nombre,
              style: TextStyle(color: black),
            )
          ],
        ),
      ),
    );
  }
}
