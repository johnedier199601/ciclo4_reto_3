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
          return ListView.builder(
            itemCount: respuesta.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(respuesta.data!.docs[index].get("mesaje")),
              );
            },
          );
        });
  }
}
