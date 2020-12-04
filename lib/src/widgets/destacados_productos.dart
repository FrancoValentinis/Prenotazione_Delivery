import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/ayudas/colores.dart';
import 'package:prenotazione_delivery/src/ayudas/pantalla_navegacion.dart';
import 'package:prenotazione_delivery/src/models/productos.dart';
import 'package:prenotazione_delivery/src/pantallas/detalles.dart';
import 'package:prenotazione_delivery/src/widgets/texto_personalizado.dart';

List<Productos> listaProductos = [
  Productos(
    nombre: "Pollo con papas",
    imagen: "comida1.png",
    precio: 420,
    rating: 4.2,
    vendedor: "Bouquet de rêves",
    listaDeseos: true,
  ),
  Productos(
    nombre: "Ensalada con mariscos",
    imagen: "comida2.png",
    precio: 235,
    rating: 4.4,
    vendedor: "La toscana",
    listaDeseos: false,
  ),
  Productos(
    nombre: "Pollo a la plancha",
    imagen: "comida3.png",
    precio: 450,
    rating: 4.8,
    vendedor: "Achicoria",
    listaDeseos: true,
  ),
];

class Destacados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listaProductos.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(12, 14, 16, 12),
                child: GestureDetector(
                  onTap: () {
                    cambiarPantallaReemplazo(
                        _, Detalles(productos: listaProductos[index]));
                  },
                  child: Container(
                    height: 220,
                    width: 225,
                    decoration: BoxDecoration(color: white, boxShadow: [
                      BoxShadow(
                          color: red[50], offset: Offset(15, 5), blurRadius: 30)
                    ]),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "imagenes/${listaProductos[index].imagen}",
                          height: 160,
                          width: 190,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextoPersonalizado(
                                  text: listaProductos[index].nombre),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: grey[300],
                                          offset: Offset(1, 1),
                                          blurRadius: 4)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: listaProductos[index].listaDeseos
                                      ? Icon(
                                          Icons.favorite,
                                          color: red,
                                          size: 16,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          color: red,
                                          size: 16,
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: TextoPersonalizado(
                                    text:
                                        listaProductos[index].rating.toString(),
                                    color: grey,
                                    size: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: grey,
                                  size: 16,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextoPersonalizado(
                                text: "\$${listaProductos[index].precio}",
                                weight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
