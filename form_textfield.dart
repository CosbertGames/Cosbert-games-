import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gaming_app/provider/form_provider.dart';
import 'package:provider/provider.dart';

class FormTextfield extends StatelessWidget {
  final FaIcon prefixIcon;
  final TextEditingController controller;
  final TextInputType? inputType;
  final List<FieldValidator> validators;
  final String hintText;
  final bool isPassword;

  const FormTextfield({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.validators,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(
      builder: (context, notifier, child) {
        return TextFormField(
          keyboardType: inputType,
          validator: (value) {
            for (var validator in validators) {
              final result = validator(value);
              if (result != null) {
                return result;
              }
            }
            return null;
          },
          controller: controller,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          obscureText: isPassword && notifier.obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: isPassword
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    child: IconButton(
                      onPressed: notifier.tooglePasswordVisibility,
                      icon: FaIcon(
                        notifier.obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        color: Colors.black,
                      ),
                    ),
                  )
                : null,
            hintStyle: const TextStyle(fontSize: 20, color: Colors.black),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: prefixIcon,
            ),
            fillColor: Colors.grey.shade400,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(width: 2, color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(width: 2, color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
