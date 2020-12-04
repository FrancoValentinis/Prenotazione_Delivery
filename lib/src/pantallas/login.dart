import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/ayudas/colores.dart';
import 'package:prenotazione_delivery/src/widgets/texto_personalizado.dart';

class LoginPantalla extends StatefulWidget {
  @override
  _LoginPantallaState createState() => _LoginPantallaState();
}

class _LoginPantallaState extends State<LoginPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "imagenes/login.png",
                  width: 240,
                  height: 240,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        icon: Icon(Icons.email)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Contraseña",
                        icon: Icon(Icons.lock)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    color: red,
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextoPersonalizado(
                          text: "Iniciar Sesion",
                          color: white,
                          size: 22,
                        )
                      ],
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextoPersonalizado(
                  text: "No tienes cuenta? Registrarse",
                  size: 18,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
