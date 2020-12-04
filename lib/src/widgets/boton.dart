import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/ayudas/colores.dart';

class Boton extends StatelessWidget {
  final IconData icono;

  Boton(this.icono);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(
            icono,
            size: 16,
            color: white,
          ),
        ),
      ),
    );
  }
}
