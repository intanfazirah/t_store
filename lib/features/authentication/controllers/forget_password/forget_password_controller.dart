import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/constants/image_strings.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try{
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) { TFullScreenLoader.stopLoading(); return;}

      // Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link sent to reset your password'.tr); //.tr stands for translate. It is used to translate a string key into the localized string for the current language.

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      }

    }

  resendPasswordResetEmail(String email) async {
    try{
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) { TFullScreenLoader.stopLoading(); return;}


      // Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link sent to reset your password'.tr); //.tr stands for translate. It is used to translate a string key into the localized string for the current language.

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}// end