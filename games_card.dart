import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gaming_app/service/game_service.dart';
import 'package:gaming_app/view/screen/recommended_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GamesCard extends StatelessWidget {
  final String sortBy;
  const GamesCard({super.key, required this.sortBy});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getGames(sortBy),
      builder: (context, snapshot) {
        bool isLoading = snapshot.connectionState == ConnectionState.waiting;
        if (snapshot.hasError) {
          return Center(
            child: SelectableText('An Error occurred: ${snapshot.error}'),
          );
        }
        final games = snapshot.data ?? [];
        return SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: games.length,
            itemBuilder: (context, index) {
              return Skeletonizer(
                enabled: isLoading,
                containersColor: Colors.grey,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RecommendedScreen(game: games[index]);
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 350,
                    height: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      image: isLoading
                          ? null
                          : DecorationImage(
                              image: NetworkImage(games[index].thumbnail),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ).animate().scale();
            },
          ),
        );
      },
    );
  }
}
