import 'package:cryptoapp/Model/user_model.dart';
import 'package:cryptoapp/controllers/shared_pref_controller.dart';

import 'package:get/get.dart';

class UserController extends GetxController {
  late UserModel user;
  setUser(UserModel userModel) async {
    user = userModel;
    saveToPref(userModel);

  }
static saveToPref(UserModel userModel, {String profilePicLink = ""}) async {
    final SharedPrefsController sharedPrefsController =
        Get.find(tag: 'sharedPrefsController');
    await sharedPrefsController.setString('uid', userModel.userID);
    await sharedPrefsController.setString('email', userModel.email);
    await sharedPrefsController.setString('firstName', userModel.firstName);
    await sharedPrefsController.setString('lastName', userModel.lastName);
    await sharedPrefsController.setString(
        'profilePicLink', userModel.profilePictureLink);
    await sharedPrefsController.setBool('signedIn', true);
  }
  String getEmail() {
    return user.email;
  }

  String getName() {
    return '${user.firstName} ${user.lastName}';
  }

  String getDP() {
    return user.profilePictureLink;
  }
}
