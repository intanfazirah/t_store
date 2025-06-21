import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

import 'package:firebase_app_check/firebase_app_check.dart';

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

  // Enable Firebase App Check (use debug for dev, PlayIntegrity for production)
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug, // or .playIntegrity for production
    appleProvider: AppleProvider.debug,
  );


  //Todo: Initialize Authentication



  runApp(const App());
}

