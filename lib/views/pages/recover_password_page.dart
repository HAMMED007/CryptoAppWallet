import 'package:cryptoapp/Services/auth_services.dart';
import 'package:cryptoapp/views/pages/login_page.dart';
import 'package:cryptoapp/views/widgets/filled_button.dart';
import 'package:cryptoapp/views/widgets/outlined_button.dart';
import 'package:cryptoapp/views/widgets/sucess_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  final String email;
  const ResetPassword({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SuccessWidget(
          text: "Please check your email for a password resent link",
        ),
        FilledButtonWidget(
            text: "Didn’t get any email? Resend",
            onPressed: () => {AuthService.resetPassword(email)}),
        OutlinedButtonWidget(
            text: "Remembered password? Login",
            onPressed: () => {Get.to(const LoginPage())})
      ],
    );
  }
}
