import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/ayudas/colores.dart';
import 'package:prenotazione_delivery/src/models/productos.dart';
import 'package:prenotazione_delivery/src/widgets/texto_personalizado.dart';

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
            Container(
              height: 290,
              child: Stack(
                children: <Widget>[
                  Carousel(
                    images: [
                      AssetImage('imagenes/${widget.productos.imagen}'),
                      AssetImage('imagenes/${widget.productos.imagen}'),
                      AssetImage('imagenes/${widget.productos.imagen}'),
                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: red,
                    dotIncreaseSize: 1.2,
                    autoplay: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "imagenes/compras.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 0,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: grey,
                                            offset: Offset(2, 1),
                                            blurRadius: 3)
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4),
                                    child: TextoPersonalizado(
                                      text: "2",
                                      color: red,
                                      size: 18,
                                      weight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 20,
                    bottom: 54,
                    child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: grey[400],
                                offset: Offset(2, 1),
                                blurRadius: 3)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          Icons.favorite,
                          size: 22,
                          color: red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextoPersonalizado(
              text: widget.productos.nombre,
              size: 22,
              weight: FontWeight.bold,
            ),
            TextoPersonalizado(
              text: "\$" + widget.productos.precio.toString(),
              size: 20,
              color: red,
              weight: FontWeight.w600,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                      child: TextoPersonalizado(
                        text: "Añadir al carrito",
                        color: white,
                        size: 24,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: red,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
