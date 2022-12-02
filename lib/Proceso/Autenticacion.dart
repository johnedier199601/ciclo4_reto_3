import 'package:firebase_auth/firebase_auth.dart';

class Autenticacion {
  final FirebaseAuth fire = FirebaseAuth.instance;
  User? get usuarios => fire.currentUser;
  Stream<User?> get estado_login => fire.authStateChanges();

  Future<void> Iniciar_Sesion(
      {required String email, required String password}) async {
    try {
      await fire.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> Crear_Usuario(
      {required String email, required String password}) async {
    try {
      await fire.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> Cerrar_Sesion() async {
    try {
      await fire.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
