import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/config/network/local/cach_helper.dart';
import 'package:latest_news/my_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();
  uId = CacheHelper.getData(key: "uId");
  token = CacheHelper.getData(key: 'Gtoken');
  log("UID :::  ${CacheHelper.getData(key: "uId")}");
  log(" ACCESS TOKEN ::: ${CacheHelper.getData(key: "Gtoken")}");

  runApp(const MyApp());
}
