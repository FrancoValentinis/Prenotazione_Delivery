import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/colores.dart';
import 'package:prenotazione_delivery/src/widgets/boton.dart';
import 'package:prenotazione_delivery/src/widgets/boton_de_navegacion.dart';
import 'package:prenotazione_delivery/src/widgets/categorias.dart';
import 'package:prenotazione_delivery/src/widgets/destacados_productos.dart';
import 'package:prenotazione_delivery/src/widgets/texto_personalizado.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextoPersonalizado(
                      text: "Que te gustaria comer?",
                      size: 18,
                    )),
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      onPressed: () {},
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(
                      color: grey[300], offset: Offset(1, 1), blurRadius: 4)
                ]),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: red,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Encuentre comida y Restaurante",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: red,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categorias(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextoPersonalizado(
                text: "Destacados",
                size: 20,
                color: grey,
              ),
            ),
            Destacados(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextoPersonalizado(
                text: "Populares",
                size: 20,
                color: grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("imagenes/destacado.jpg")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Boton(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow[900],
                                    size: 20,
                                  ),
                                ),
                                Text("4.8")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20)),
                          //La decoración de la caja toma un degradado
                          gradient: LinearGradient(
                            // donde comienza y termina el gradiente lineal
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            // Agregue una parada para cada color. Las paradas deben aumentar de 0 a 1
                            colors: [
                              // Los colores son fáciles gracias a la clase de color de Flutter
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Pollo salteado \n",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: white)),
                              TextSpan(
                                  text: "Por: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: white)),
                              TextSpan(
                                  text: "Casa Juez",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: white)),
                            ], style: TextStyle(color: black))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "\$ 744.99 \n",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300,
                                      color: white)),
                            ], style: TextStyle(color: black))),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 66,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BotondeNavegacion(
              imagenes: "home.png",
              nombre: "Inicio",
            ),
            BotondeNavegacion(
              imagenes: "ubicacion.png",
              nombre: "Ubicación",
            ),
            BotondeNavegacion(
              imagenes: "compras.png",
              nombre: "Compras",
            ),
            BotondeNavegacion(
              imagenes: "perfil.png",
              nombre: "Perfil",
            ),
          ],
        ),
      ),
    );
  }
}
