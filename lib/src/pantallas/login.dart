import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/ayudas/colores.dart';
import 'package:prenotazione_delivery/src/ayudas/pantalla_navegacion.dart';
import 'package:prenotazione_delivery/src/pantallas/home.dart';
import 'package:prenotazione_delivery/src/pantallas/registro.dart';
import 'package:prenotazione_delivery/src/provider/auth.dart';
import 'package:prenotazione_delivery/src/widgets/cargando.dart';
import 'package:prenotazione_delivery/src/widgets/texto_personalizado.dart';
import 'package:provider/provider.dart';

class LoginPantalla extends StatefulWidget {
  @override
  _LoginPantallaState createState() => _LoginPantallaState();
}

class _LoginPantallaState extends State<LoginPantalla> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final autenticacionProvider = Provider.of<AutenticacionProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: autenticacionProvider.status == Status.Authenticating
          ? Cargando()
          : SingleChildScrollView(
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
                          controller: autenticacionProvider.email,
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
                          controller: autenticacionProvider.passw,
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
                    child: GestureDetector(
                      onTap: () async {
                        if (!await autenticacionProvider.iniciarSesion()) {
                          // ignore: deprecated_member_use
                          _key.currentState.showSnackBar(SnackBar(
                            content: Text("Error de inicio de sesion"),
                          ));
                          return;
                        }
                        autenticacionProvider.limpiarControladores();
                        cambiarPantallaReemplazo(context, Home());
                      },
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
                  ),
                  GestureDetector(
                    onTap: () {
                      cambiarPantalla(context, RegistroPantalla());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextoPersonalizado(
                          text: "No tienes cuenta? Registrarse",
                          size: 18,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
