import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_pemrograman_mobile/controller/login_controller.dart';
import 'package:uas_pemrograman_mobile/widget/button.dart';
import 'package:uas_pemrograman_mobile/widget/text_form.dart';

class LoginView extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            usernameForm(context),
            const SizedBox(height: 20),
            passwordForm(context),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              onPressed: () {
                loginController.login(usernameController.text, passwordController.text);
              },
            ),
          ],
        )
      ),
    );
  }

  TextForm usernameForm(BuildContext context) => TextForm(
    controller: usernameController,
    labelText: 'Username',
    hintText: 'Masukkan Username',
  );

  TextForm passwordForm(BuildContext context) => TextForm(
    controller: passwordController,
    labelText: 'Password',
    hintText: 'Masukkan Password',
    obscureText: true,
  );
  
}