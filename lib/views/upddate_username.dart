import 'package:cryptoapp/Services/auth_services.dart';
import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/views/app_navigation.dart';
import 'package:cryptoapp/views/pages/forget_password_page.dart';
import 'package:cryptoapp/views/pages/signup_page.dart';
import 'package:cryptoapp/views/widgets/custom_dialogues.dart';
import 'package:cryptoapp/views/widgets/filled_button.dart';
import 'package:cryptoapp/views/widgets/outlined_button.dart';
import 'package:cryptoapp/views/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class UpdateUserName extends StatefulWidget {
  const UpdateUserName({super.key});
//afenifere hammed
  @override
  State<UpdateUserName> createState() => _UpdateUserNameState();
}

class _UpdateUserNameState extends State<UpdateUserName> {
  bool isEng = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController oldNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  AuthService authService = AuthService();

  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("Change User Name",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const Text("Update your username",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                )),
            const SizedBox(
              height: 30,
            ),
            TextFieldWidget(
              textController: oldNameController,
              titleText: "Old username",
            ),
            TextFieldWidget(
              textController: firstNameController,
              titleText: "Email",
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              obscureText: true,
              textController: lastNameController,
              titleText: "Password",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => {Get.to(const ForgetPassword())},
                    child: const Text(
                      "Forget password?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButtonWidget(
              text: "Existing user? Login",
              onPressed: () async => {
                customLoadingDialog(),
                result = await authService.signIn(
                    firstNameController.text, lastNameController.text),
                Get.back(),
                if (result == "success")
                  {Get.offAll(const AppNavigation())}
                else if (result == 'weak-password')
                  {
                    generateError(
                        "Weak Password", "The password provided is too weak."),
                    print('The password provided is too weak.'),
                  }
                else if (result == 'email-already-in-use')
                  {
                    generateError("Email Already Exists",
                        "The account already exists for that email."),
                    print('The account already exists for that email.'),
                  }
                else
                  {generateError("Failure", result)}
              },
            ),
            OutlinedButtonWidget(
              text: "New user? Create an account",
              onPressed: () => {Get.to(SignUp())},
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Or Continue with",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      AuthService.googleSignIn();
                    },
                    child: Image.asset(AssetConstants.facebook)),
                GestureDetector(
                    onTap: () {
                      AuthService.googleSignIn();
                    },
                    child: Image.asset(AssetConstants.google)),
              ],
            )
          ],
        ),
      ) /* add child content here */,
    ));
  }
}
