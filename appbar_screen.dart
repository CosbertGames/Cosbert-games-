import 'package:flutter/material.dart';
import 'package:gaming_app/provider/form_provider.dart';
import 'package:gaming_app/provider/main_provider.dart';
import 'package:gaming_app/utils/sizebox_extension.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';

class AppbarScreen extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppbarScreen({super.key}) : preferredSize = const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<FormProvider>(context);
    Widget avatar = RandomAvatar(
      userName.name,
      height: 100,
      width: 100,
    );
    return Consumer2<FormProvider, MainProvider>(
      builder: (context, formNotifier, mainNotifier, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: CircleAvatar(
              child: avatar,
            ),
            title: Text(
              '${mainNotifier.getGreetings()}\n${formNotifier.name.toUpperCase()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Colors.white,
              ),
            ),
            actions: [
              CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.grey,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
              15.width,
              CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.grey,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
