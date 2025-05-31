import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../models/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  /// Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async{
    try{
      if(userCredentials !=null) {
        // convert name to first and last name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final  username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Map Data
        final newUser = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : "",
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save user data
        await UserRepository.instance.saveUserRecord(newUser);
      }
    } catch (e){
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your profile',
      );
    }
  }
}//end