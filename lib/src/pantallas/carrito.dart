import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/ayudas/colores.dart';
import 'package:prenotazione_delivery/src/models/productos.dart';
import 'package:prenotazione_delivery/src/widgets/texto_personalizado.dart';

class Carrito extends StatefulWidget {
  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  Productos productos = Productos(
    nombre: "Pollo con papas",
    imagen: "comida1.png",
    precio: 420,
    rating: 4.2,
    vendedor: "Bouquet de rêves",
    listaDeseos: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: black,
          ),
          onPressed: () {},
        ),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: TextoPersonalizado(
          text: "Carrito de compras",
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "imagenes/compras.png",
                    width: 30,
                    height: 30,
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: grey[400],
                                offset: Offset(2, 1),
                                blurRadius: 3)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: TextoPersonalizado(
                          text: "2",
                          color: red,
                          size: 16,
                          weight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 120,
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(color: red[100], offset: Offset(3, 7), blurRadius: 30)
              ]),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "imagenes/${productos.imagen}",
                    height: 160,
                    width: 170,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: productos.nombre + "\n",
                              style: TextStyle(color: black, fontSize: 17)),
                          TextSpan(
                              text: "\$" + productos.precio.toString() + "\n",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
