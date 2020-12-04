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
}
