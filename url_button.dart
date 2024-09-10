import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlButton extends StatelessWidget {
  final String game;
  final String title;
  final Color? color;
  final Color? textColor;
  const UrlButton({
    super.key,
    required this.game,
    required this.title,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> launch() async {
      final Uri url = Uri.parse(game);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: launch,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
