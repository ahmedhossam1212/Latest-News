import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:latest_news/my_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
