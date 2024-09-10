import 'package:flutter/material.dart';

class FormTextbutton extends StatelessWidget {
  final Widget screen;
  final String linkText;
  final String descText;
  const FormTextbutton(
      {super.key,
      required this.screen,
      required this.linkText,
      required this.descText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          descText,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return screen;
                },
              ),
            );
          },
          child: Text(
            linkText,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
        ),
      ],
    );
  }
}
