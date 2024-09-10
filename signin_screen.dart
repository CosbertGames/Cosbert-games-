import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gaming_app/provider/form_provider.dart';
import 'package:gaming_app/utils/constants.dart';
import 'package:gaming_app/utils/sizebox_extension.dart';
import 'package:gaming_app/view/components/form_button.dart';
import 'package:gaming_app/view/components/form_textbutton.dart';
import 'package:gaming_app/view/components/form_textfield.dart';
import 'package:gaming_app/view/screen/signup_screen.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: SvgPicture.asset(
                      'assets/svg/log_in.svg',
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),
                50.height,
                Text('Login', style: formText),
                Text('Please sign in to continue', style: formTextMini),
                15.height,
                Consumer<FormProvider>(
                  builder: (context, notifier, child) {
                    return Form(
                      key: notifier.fromKey1,
                      child: Column(
                        children: [
                          FormTextfield(
                            validators: [
                              RequiredValidator(
                                errorText: 'username is required',
                              )
                            ],
                            controller: notifier.userNameController,
                            prefixIcon: const FaIcon(FontAwesomeIcons.user,
                                color: Colors.black),
                            hintText: 'username',
                          ),
                          15.height,
                          FormTextfield(
                            validators: [
                              MinLengthValidator(
                                8,
                                errorText:
                                    'Password be atleast 8 characters long',
                              ),
                              RequiredValidator(
                                errorText: 'Password is required',
                              )
                            ],
                            controller: notifier.passwordController,
                            isPassword: true,
                            prefixIcon: const FaIcon(FontAwesomeIcons.lock,
                                color: Colors.black),
                            hintText: 'password',
                          ),
                        ],
                      ),
                    );
                  },
                ),
                20.height,
                const FormButton(
                  text: 'Sign in',
                ),
                const FormTextbutton(
                  screen: SignupScreen(),
                  descText: 'Don\'t have an account?',
                  linkText: 'sing up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
