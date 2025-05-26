import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


/// Entry point of Flutter App
Future<void> main() async {

  //Todo: Add Widgets Binding
  //Todo: Init Local Storage
  //Todo: Init Payment Methods
  //Todo: Await Native Splash

  //Todo: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  //Todo: Initialize Authentication


  runApp(const App());
}

