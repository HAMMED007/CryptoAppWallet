import 'package:cryptoapp/Model/user_model.dart';
import 'package:cryptoapp/Services/database_service.dart';
import 'package:cryptoapp/controllers/database_controller.dart';
import 'package:cryptoapp/controllers/shared_pref_controller.dart';
import 'package:cryptoapp/controllers/user_controller.dart';
import 'package:cryptoapp/views/app_navigation.dart';
import 'package:cryptoapp/views/pages/login_page.dart';
import 'package:cryptoapp/views/pages/signout_page.dart';
import 'package:cryptoapp/views/widgets/custom_dialogues.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final UserController userController = Get.find(tag: "userController");

  DatabaseController databaseController = Get.find(tag: 'databaseController');
  Future<void> autoLogin() async {
    final SharedPrefsController sharedPrefsController =
        Get.find(tag: 'sharedPrefsController');
    String uid = sharedPrefsController.getString('uid');
    String email = sharedPrefsController.getString('email');
    String firstName = sharedPrefsController.getString('firstName');
    String lastName = sharedPrefsController.getString('lastName');
    bool signedIn = sharedPrefsController.getBool('signedIn');
    String profilePicLink = sharedPrefsController.getString('profilePicLink');
    if (signedIn) {
      final userModel = UserModel(
          email: email,
          userID: uid,
          profilePictureLink: profilePicLink,
          firstName: firstName,
          lastName: lastName);
      userController.setUser(userModel);

      Get.offAll(const AppNavigation());
    } else {
      Get.offAll(const LoginPage());
    }
  }

  static Future<void> resetPassword(email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      generateMessage("Check Your Email", "To reset your Password");
      Get.offAll(const LoginPage());
    } catch (e) {
      generateError("Incorrect Email ", "Please Try Again");
    }
  }

  Future<String> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async { 
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userModel = UserModel(
          email: email,
          userID: credential.user!.uid,
          profilePictureLink: databaseController.uploadedFileLink,
          firstName: firstName,
          lastName: lastName);
      userController.setUser(userModel);
      DatabaseService().addUser(userModel);

      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        generateError("Weak Password", "The password provided is too weak.");
        return e.code;
      } else if (e.code == 'email-already-in-use') {
        generateError("Email Already Exists",
            "The account already exists for that email.");
        return e.code;
      } else {
        return "Something went wrong.";
      }
    } catch (e) {
      return "Something went wrong.";
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      UserModel userModel =
          await DatabaseService().getUser(credential.user!.uid);

      userController.setUser(userModel);

      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return "Something went wrong.";
      }
    }
  }

  static Future<bool> googleSignIn() async {
    final SharedPrefsController sharedPrefsController =
        Get.find(tag: 'sharedPrefsController');
    final UserController userController = Get.find(tag: "userController");

    try {
      UserCredential user = await signInWithGoogle();
      if (user.user != null) {
        sharedPrefsController.setString("userId", user.user!.uid);
        final displayName = user.user!.displayName ?? '';
        final profilePic = user.user!.photoURL ?? '';
        final email = user.user!.email ?? '';
        List<String> names = displayName.split(" ");
        String firstName = "";
        String lastName = "";
        if (names.isNotEmpty) {
          firstName = names[0];
          lastName = names[1];
        }
        final userModel = UserModel(
            email: email,
            userID: user.user!.uid,
            profilePictureLink: profilePic,
            firstName: firstName,
            lastName: lastName);
        userController.setUser(userModel);
        DatabaseService().addUser(userModel);
        Get.offAll(const AppNavigation());
      }
      return user.user!.displayName != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignIn _googleSignIn = GoogleSignIn(
        signInOption: SignInOption.standard,
        clientId:
            '291860264740-rmqfdba7uup3mio2h8pnm4eoh9b65l5g.apps.googleusercontent.com');
    final SharedPrefsController sharedPrefsController =
        Get.find(tag: 'sharedPrefsController');

    GoogleSignInAccount? googleUser;
    //separate for ios and android platfrom
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      googleUser = await _googleSignIn.signIn();
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      googleUser = await GoogleSignIn().signIn();
    }

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    googleUser?.photoUrl;

    sharedPrefsController.setString(
        "accessToken", googleAuth?.accessToken ?? '');
    sharedPrefsController.setString(
        "accessToken", googleAuth?.accessToken ?? '');
    sharedPrefsController.setString("idToken", googleAuth?.idToken ?? '');
    String act = googleAuth?.accessToken ?? 'Not able to get the Accesstoken';
    final user = await _auth.signInWithCredential(credential);

    return await _auth.signInWithCredential(credential);
  }

  static Future<bool> googleSignOut() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignIn _googleSignIn = GoogleSignIn(
      signInOption: SignInOption.standard,
    );

    final SharedPrefsController sharedPrefsController =
        Get.find(tag: 'sharedPrefsController');
    sharedPrefsController.removeString("userName");
    sharedPrefsController.removeString("userId");
    await _googleSignIn.signOut();

    await _auth.signOut();
    return true;
  }

  Future<void> signOut() async {
    final SharedPrefsController sharedPrefsController =
        Get.find(tag: 'sharedPrefsController');
    userController.user.userID = "";
    userController.user.email = "";

    sharedPrefsController.clear();

    await auth.signOut();
    googleSignOut();
    Get.offAll(const SignOutPage());
  }
}
