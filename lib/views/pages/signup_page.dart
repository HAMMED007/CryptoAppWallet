import 'package:cryptoapp/Model/user_model.dart';
import 'package:cryptoapp/Services/auth_services.dart';
import 'package:cryptoapp/views/app_navigation.dart';
import 'package:cryptoapp/views/pages/login_page.dart';
import 'package:cryptoapp/views/widgets/custom_dialogues.dart';
import 'package:cryptoapp/views/widgets/pick_image.dart';
import 'package:cryptoapp/views/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isEng = true;
  bool termsAccepted = true;
  AuthService authService = AuthService();
  String result = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
            const Text(
              "Create An Account",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // SizedBox(
            //     height: 130,
            //     child: PickAndUploadImage(firebasePath: "profile_pics")),

            TextFieldWidget(
              textController: firstNameController,
              titleText: "First Name",
            ),
            TextFieldWidget(
              textController: lastNameController,
              titleText: "Last Name",
            ),

            TextFieldWidget(
              textController: emailController,
              titleText: "Email",
            ),

            TextFieldWidget(
                obscureText: true,
                textController: passwordController,
                titleText: "Password"),
            TextFieldWidget(
                obscureText: true,
                textController: confirmPasswordController,
                titleText: "Confirm Password"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  activeColor: Colors.black,
                  value: termsAccepted,
                  onChanged: (bool? value) {
                    setState(() {
                      termsAccepted = value!;
                    });
                  },
                ),
                const Text(
                  "I agree to the ",
                  style: TextStyle(color: Colors.grey),
                ),
                const Text("Terms and Contions "),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: () async {
                  if (emailController.text.isEmpty ||
                      firstNameController.text.isEmpty ||
                      confirmPasswordController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    Get.snackbar("Error", "Please fill all the fields",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white);
                  } else if (confirmPasswordController.text !=
                      passwordController.text) {
                    Get.snackbar("Confirm Password doest not match", "",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white);
                  } else if (!termsAccepted) {
                    Get.snackbar("Error", "Please accept the terms",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white);
                  } else {
                    customLoadingDialog();
                    result = await authService.signUp(
                        emailController.text,
                        passwordController.text,
                        firstNameController.text,
                        lastNameController.text);
                    Get.back();
                    if (result == "success") {
                      Get.offAll(const AppNavigation());
                    } else if (result == 'weak-password') {
                      generateError("Weak Password",
                          "The password provided is too weak.");
                      print('The password provided is too weak.');
                    } else if (result == 'email-already-in-use') {
                      generateError("Email Already Exists",
                          "The account already exists for that email.");
                      print('The account already exists for that email.');
                    } else {
                      generateError("Error", "Something went wrong");
                      print(result);
                    }
                  }
                },
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 120.0, vertical: 25),
                  child: Text("Signup"),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: () => Get.to(LoginPage()),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 95.0, vertical: 20),
                  child: Text(
                    "Login Instead",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ],
        ),
      ) /* add child content here */,
    ));
  }
}
