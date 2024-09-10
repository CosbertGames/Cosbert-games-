import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  String _name = '';

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  TextEditingController get userNameController => _userNameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get phoneController => _phoneController;
  get fromKey1 => _formKey1;
  get fromKey2 => _formKey2;
  String get name => _name;

  tooglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  setUser(String name) {
    _name = name;
  }
}
