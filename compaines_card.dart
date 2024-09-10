import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../model/games_model.dart';
import '../../service/game_service.dart';

class CompainesCard extends StatelessWidget {
  const CompainesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GamesModel>>(
      future: getGames('popularity'),
      builder: (context, snapshot) {
        bool isLoading = snapshot.connectionState == ConnectionState.waiting;
        if (snapshot.hasError) {
          return Center(
            child: SelectableText('An Error occurred: ${snapshot.error}'),
          );
        }
        final games = snapshot.data ?? [];
        return SizedBox(
          height: 50,
          child: Skeletonizer(
            enabled: isLoading,
            containersColor: Colors.grey,
            // effect: ShimmerEffect(
            //   baseColor: Colors.grey.shade300,
            // ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                final colors =
                    Colors.primaries[index % Colors.primaries.length];
                if (games.isEmpty || index >= games.length) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: colors,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Loading...',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }
                final game = games[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: colors,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      game.publisher,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ).animate().scale(),
        );
      },
    );
  }
}
