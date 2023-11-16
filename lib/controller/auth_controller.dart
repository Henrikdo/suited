import 'package:get/get.dart';
import 'package:suited/models/LoggedUser.dart';
import 'package:suited/utils/utils.dart';
import 'package:suited/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthController extends GetxController{
  AuthService _authService = Get.put(AuthService());
  final status = authStatus.idle.obs;
  LoggedUser? user;

  signInAnon() async {
    status.value = authStatus.loading;

    try{
      var result = await _authService.signInAnon();
      if (result != null) {
        user = result;
        print('signed in');
        print(result.uid);
        status.value = authStatus.success;
      } else {
        print('error signing in');
        status.value = authStatus.error;
      }
    }catch(e){
      print('error signing in');
      status.value = authStatus.error;
    }

  }

}