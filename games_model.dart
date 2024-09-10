// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GamesModel {
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String profile;

  GamesModel({
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.profile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'thumbnail': thumbnail,
      'shortDescription': shortDescription,
      'gameUrl': gameUrl,
      'genre': genre,
      'platform': platform,
      'publisher': publisher,
      'developer': developer,
      'releaseDate': releaseDate,
      'profile': profile,
    };
  }

  factory GamesModel.fromMap(Map<String, dynamic> map) {
    return GamesModel(
      title: map['title'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      shortDescription: map['short_description'] ?? '',
      gameUrl: map['game_url'] ?? '',
      genre: map['genre'] ?? '',
      platform: map['platform'] ?? '',
      publisher: map['publisher'] ?? '',
      developer: map['developer'] ?? '',
      releaseDate: map['release_date'] ?? '',
      profile: map['freetogame_profile_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GamesModel.fromJson(String source) =>
      GamesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
