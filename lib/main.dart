import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'data/repositories/authentication_repository.dart';
import 'firebase_options.dart';


/// Entry point of Flutter App
Future<void> main() async {

  ///Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// GetX Local Storage
  await GetStorage.init();

  ///Await Native Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///Initialize Firebase
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  //Todo: Initialize Authentication


  runApp(const App());
}

