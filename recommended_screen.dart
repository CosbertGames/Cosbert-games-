import 'package:flutter/material.dart';
import 'package:gaming_app/model/games_model.dart';
import 'package:gaming_app/utils/constants.dart';
import 'package:gaming_app/utils/sizebox_extension.dart';
import 'package:gaming_app/view/components/url_button.dart';

class RecommendedScreen extends StatelessWidget {
  final GamesModel game;
  const RecommendedScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                minRadius: 200,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            elevation: 0,
            pinned: true,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: NetworkImage(game.thumbnail),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    game.title,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  10.height,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue.shade900,
                        ),
                        child: Text(
                          game.genre,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.height,
                  Text(game.shortDescription, style: categories),
                  10.height,
                  Text('Platform: ${game.platform}', style: categories),
                  10.height,
                  Text('Publisher: ${game.publisher}', style: categories),
                  10.height,
                  Text('Developer: ${game.developer}', style: categories),
                  10.height,
                  Text('Release-date: ${game.releaseDate}', style: categories),
                  30.height,
                  UrlButton(
                    game: game.profile,
                    title: 'More info',
                    textColor: Colors.black,
                  ),
                  15.height,
                  UrlButton(
                    game: game.gameUrl,
                    title: 'Download',
                    color: Colors.blue.shade900,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
