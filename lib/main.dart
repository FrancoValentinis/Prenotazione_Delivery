import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/pantallas/home.dart';
import 'package:prenotazione_delivery/src/pantallas/login.dart';
import 'package:prenotazione_delivery/src/provider/auth.dart';
import 'package:prenotazione_delivery/src/widgets/cargando.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AutenticacionProvider.initialize())
    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prenotazione Delivery',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ControladorPantalla()),
  ));
}

class ControladorPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AutenticacionProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Cargando();
      case Status.Unauthenticated:
        return LoginPantalla();
      case Status.Authenticated:
        return Home();
      default:
        return LoginPantalla();
    }
  }
}
