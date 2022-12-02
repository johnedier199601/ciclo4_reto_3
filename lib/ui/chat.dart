import 'package:aplicacion_de_chat/Proceso/Autenticacion.dart';
import 'package:aplicacion_de_chat/ui/mensajes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;
final foco = FocusNode();

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Text((Autenticacion().usuarios?.email).toString())),
            IconButton(
                onPressed: () {
                  Autenticacion().Cerrar_Sesion();
                },
                icon: Icon(Icons.logout_outlined))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Expanded(child: mesajes()),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: foco,
                    controller: mensaje,
                    decoration: InputDecoration(hintText: "Mensaje..."),
                    onSubmitted: (valor) {
                      foco.requestFocus();
                      if (mensaje.text.isNotEmpty) {
                        mensaje.text = valor;
                        fire.collection("Chat").doc().set({
                          "mesaje": mensaje.text,
                          "tiempo": DateTime.now(),
                          "email": Autenticacion().usuarios?.email
                        });

                        mensaje.clear();
                      }
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (mensaje.text.isNotEmpty) {
                        fire.collection("Chat").doc().set({
                          "mesaje": mensaje.text,
                          "tiempo": DateTime.now(),
                          "email": (Autenticacion().usuarios?.email).toString()
                        });
                        mensaje.clear();
                      }
                    },
                    icon: Icon(Icons.send_outlined))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
