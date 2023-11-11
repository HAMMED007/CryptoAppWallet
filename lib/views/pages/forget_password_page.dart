import 'package:cryptoapp/Services/auth_services.dart';
import 'package:cryptoapp/views/pages/login_page.dart';
import 'package:cryptoapp/views/pages/recover_password_page.dart';

import 'package:cryptoapp/views/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isEng = true;
  bool termsAccepted = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              height: 120,
            ),
            Text(
              "Forget Password",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              textController: emailController,
              titleText: "Email",
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
                onPressed: () => {
                      AuthService.resetPassword(emailController.text),
                      Get.to(ResetPassword(
                        email: emailController.text,
                      ))
                    },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 25),
                  child: Text(
                    "Recover Your Password",
                  ),
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
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20),
                  child: Text(
                    "Remember Your Password ?Login ",
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
