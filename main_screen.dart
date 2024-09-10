import 'package:flutter/material.dart';
import 'package:gaming_app/utils/constants.dart';
import 'package:gaming_app/utils/sizebox_extension.dart';
import 'package:gaming_app/view/components/appbar_screen.dart';
import 'package:gaming_app/view/components/compaines_card.dart';
import 'package:gaming_app/view/components/games_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            toolbarHeight: 90,
            floating: true,
            snap: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: AppbarScreen(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Text('Top companies', style: textTitle),
                  10.height,
                  const CompainesCard(),
                  30.height,
                  const Text('Recommended games', style: textTitle),
                  10.height,
                  const GamesCard(
                    sortBy: 'relevant',
                  ),
                  30.height,
                  const Text('Popular games', style: textTitle),
                  10.height,
                  const GamesCard(
                    sortBy: 'popularity',
                  ),
                  30.height,
                  const Text('Newest games', style: textTitle),
                  10.height,
                  const GamesCard(sortBy: 'release-date'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
