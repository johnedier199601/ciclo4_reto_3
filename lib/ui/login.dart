import 'package:aplicacion_de_chat/Proceso/Autenticacion.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final email = TextEditingController();
final password = TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login/Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                  hintText: "Email", suffixIcon: Icon(Icons.email_outlined)),
            ),
            TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                  hintText: "Password", suffixIcon: Icon(Icons.key)),
            ),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  Autenticacion().Iniciar_Sesion(
                      email: email.text, password: password.text);
                },
                icon: Icon(Icons.login_outlined),
                label: Text("Iniciar Sesión")),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  Autenticacion().Crear_Usuario(
                      email: email.text, password: password.text);
                },
                icon: Icon(Icons.person_add_alt),
                label: Text("Registrar Usuario")),
          ],
        ),
      ),
    );
  }
}
