import 'package:flutter/material.dart';
import 'package:gaming_app/provider/form_provider.dart';
import 'package:gaming_app/view/screen/main_screen.dart';
import 'package:provider/provider.dart';

class FormButton extends StatelessWidget {
  final String text;

  const FormButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(
      builder: (context, notifier, child) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade900,
            minimumSize: const Size(double.infinity, 60),
          ),
          onPressed: () {
            notifier.setUser(notifier.userNameController.text);
            final formKey =
                text == 'Sign in' ? notifier.fromKey1 : notifier.fromKey2;
            formKey.currentState!.validate();
            if (formKey.currentState!.validate()) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            }
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        );
      },
    );
  }
}
