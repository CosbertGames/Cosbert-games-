import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:note_app/utils/sizebox_extension.dart';
import 'package:note_app/view/components/home_appbar.dart';
import 'package:note_app/view/components/home_button.dart';
import 'package:note_app/view/components/home_textfield.dart';
import 'package:note_app/view/components/social_media_card.dart';
import 'package:note_app/view/screen/login_screen.dart';
import 'package:note_app/view/screen/note_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: const HomeAppbar(title: 'Sign up'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign up with one of following options',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            20.height,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SocialMediaCard(path: 'assets/google.png'),
                SocialMediaCard(path: 'assets/apple.png'),
              ],
            ),
            const Spacer(),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  10.height,
                  HomeTextfield(
                    controller: nameController,
                    hintText: 'Cee Jay',
                    validators: [
                      RequiredValidator(errorText: 'Name is required')
                    ],
                  ),
                  25.height,
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  10.height,
                  HomeTextfield(
                    controller: emailController,
                    hintText: 'tim@gmail.com',
                    validators: [
                      EmailValidator(errorText: 'Enter a valid email address'),
                      RequiredValidator(errorText: 'Email is required')
                    ],
                  ),
                  25.height,
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  // 10.height,
                  HomeTextfield(
                    controller: passwordController,
                    hintText: 'Pick a strong password',
                    validators: [
                      RequiredValidator(errorText: 'Password is required')
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            HomeButton(
              title: 'Create Account',
              onPressed: () {
                final nameText = nameController.text;
                final passwordText = passwordController.text;
                if (formKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NoteScreen(
                          password: passwordText,
                          title: nameText,
                        );
                      },
                    ),
                  );
                }
              },
            ),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
