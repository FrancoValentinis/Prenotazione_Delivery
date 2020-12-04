import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prenotazione_delivery/src/ayudas/usuario.dart';
import 'package:prenotazione_delivery/src/models/usuario.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class AutenticacionProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Firestore firestore = Firestore.instance;
  ServiciosUsuario _serviciosUsuario = ServiciosUsuario();
  ModeloUsuario _modeloUsuario;

  Status get status => _status;

  ModeloUsuario get modeloUsuario => _modeloUsuario;

  FirebaseUser get user => _user;

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController passw = TextEditingController();

  AutenticacionProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> iniciarSesion() async {
    try {
      _status = Status.Authenticated;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: passw.text.trim());
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<void> cerrarSesion() {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> registrarse() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: passw.text.trim())
          .then((result) {
        firestore.collection('users').document(result.user.uid).setData({
          'nombre': nombre.text,
          'email': email.text,
          'uid': result.user.uid,
        });
      });
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  Future<void> _onStateChanged(User user) async {
    if (user == null) {
      _status = Status.Uninitialized;
    } else {
      _user = user;
      _status = Status.Authenticated;
      _modeloUsuario = await _serviciosUsuario.getUsuarioById(user.uid);
    }
    notifyListeners();
  }

  //metodos generales

  bool _onError(String error) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print("Tenemos un problema: $error");
    return false;
  }

  void limpiarControladores() {
    email.text = "";
    passw.text = "";
    nombre.text = "";
  }
}
