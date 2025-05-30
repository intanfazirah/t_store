import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class LoginController extends GetxController{

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController(); // TextEditingController used to control and listen to changes in a TextField or TextFormField.
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();



}