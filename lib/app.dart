import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/bindings/general_bindings.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/theme/theme.dart';

import 'features/authentication/screens/onboarding/onboarding.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
      //home: OnBoardingScreen(),
    );
  }
}