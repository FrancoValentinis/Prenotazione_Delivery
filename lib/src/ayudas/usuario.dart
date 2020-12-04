import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prenotazione_delivery/src/models/usuario.dart';

class ServiciosUsuario {
  String coleccion = "usuarios";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void crearUsuario(Map<String, dynamic> values) {
    String id = values["id"];
    firestore.collection(coleccion).doc(id).set(values);
  }

  void actualizarDatosUsuario(Map<String, dynamic> values) {
    firestore.collection(coleccion).doc(values["id"]).update(values);
  }

  Future<UserModel> getUsuarioById(String id) =>
      firestore.collection(coleccion).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}
