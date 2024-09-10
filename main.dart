import 'package:flutter/material.dart';
import 'package:gaming_app/provider/form_provider.dart';
import 'package:gaming_app/provider/main_provider.dart';
import 'package:gaming_app/view/screen/signin_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FormProvider()),
        ChangeNotifierProvider(create: (context) => MainProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SigninScreen(),
      ),
    );
  }
}
