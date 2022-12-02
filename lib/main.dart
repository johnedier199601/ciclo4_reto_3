import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ui/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDJgNmEprHcaSIs1zi6-Bu-CKdEJTtEnco",
          authDomain: "reto3-chat-31fd6.firebaseapp.com",
          projectId: "reto3-chat-31fd6",
          storageBucket: "reto3-chat-31fd6.appspot.com",
          messagingSenderId: "110906531463",
          appId: "1:110906531463:web:77ac4894bd7f422b046222",
          measurementId: "G-L97XL7L6Y7"));
  runApp(const MyApp());
}
