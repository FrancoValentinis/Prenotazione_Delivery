import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/widgets/texto_personalizado.dart';

class BotondeNavegacion extends StatelessWidget {
  final String imagenes;
  final String nombre;

  const BotondeNavegacion({Key key, this.imagenes, this.nombre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            "imagenes/$imagenes",
            width: 25,
            height: 25,
          ),
          SizedBox(
            height: 5,
          ),
          TextoPersonalizado(
            text: nombre,
          )
        ],
      ),
    );
  }
}
