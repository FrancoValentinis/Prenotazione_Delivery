import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/models/categoria.dart';
import 'package:prenotazione_delivery/src/colores.dart';
import 'package:prenotazione_delivery/src/widgets/texto_personalizado.dart';

List<Categoria> listaCategorias = [
  Categoria(nombre: "Ensaladas", imagenes: "ensalada.png"),
  Categoria(nombre: "Carnes", imagenes: "carnes.png"),
  Categoria(nombre: "Comida rapida", imagenes: "comida_rapida.png"),
  Categoria(nombre: "Helados", imagenes: "helado.png"),
  Categoria(nombre: "Cervezas", imagenes: "cerveza.png"),
  Categoria(nombre: "Mariscos", imagenes: "mariscos.png"),
];

class Categorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listaCategorias.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: red[50], offset: Offset(4, 6), blurRadius: 20)
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Image.asset(
                      "imagenes/${listaCategorias[index].imagenes}",
                      width: 55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextoPersonalizado(
                  text: listaCategorias[index].nombre,
                  size: 14,
                  color: black,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
