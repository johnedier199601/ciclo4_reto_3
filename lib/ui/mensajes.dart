import 'package:aplicacion_de_chat/Proceso/Autenticacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class mesajes extends StatefulWidget {
  const mesajes({super.key});

  @override
  State<mesajes> createState() => _mesajesState();
}

class _mesajesState extends State<mesajes> {
  Stream<QuerySnapshot> respuesta_consulta = FirebaseFirestore.instance
      .collection("Chat")
      .orderBy("tiempo", descending: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: respuesta_consulta,
        builder: (context, AsyncSnapshot<QuerySnapshot> respuesta) {
          return respuesta.data?.docs.isEmpty == false
              ? ListView.builder(
                  itemCount: respuesta.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: (Autenticacion().usuarios?.email).toString() ==
                              respuesta.data!.docs[index].get("email")
                          ? Colors.green[100]
                          : Colors.white,
                      child: ListTile(
                        title: Text(
                          respuesta.data!.docs[index].get("mesaje"),
                          textAlign:
                              (Autenticacion().usuarios?.email).toString() ==
                                      respuesta.data!.docs[index].get("email")
                                  ? TextAlign.right
                                  : TextAlign.left,
                        ),
                        subtitle: Text(
                          respuesta.data!.docs[index].get("email"),
                          textAlign:
                              (Autenticacion().usuarios?.email).toString() ==
                                      respuesta.data!.docs[index].get("email")
                                  ? TextAlign.right
                                  : TextAlign.left,
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
