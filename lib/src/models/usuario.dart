import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NOMBRE = "nombre";
  static const EMAIL = "email";
  static const ID = "id";

  String _nombre;
  String _email;
  String _id;

  String get nombre => _nombre;
  String get email => _email;
  String get id => _id;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _nombre = snapshot.data()[NOMBRE];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
  }
}
