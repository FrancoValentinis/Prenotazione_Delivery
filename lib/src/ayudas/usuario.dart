import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prenotazione_delivery/src/models/usuario.dart';

class ServiciosUsuario {
  String coleccion = "usuarios";
  Firestore firestore = Firestore.instance;

  void crearUsuario(Map<String, dynamic> values) {
    String id = values["id"];
    firestore.collection(coleccion).document(id).setData(values);
  }

  void actualizarDatosUsuario(Map<String, dynamic> values) {
    firestore.collection(coleccion).doc(values["id"]).updateData(values);
  }

  Future<ModeloUsuario> getUsuarioById(String id) =>
      firestore.collection(coleccion).document(id).get().then((doc) {
        return ModeloUsuario.fromSnapshot(doc);
      });
}
