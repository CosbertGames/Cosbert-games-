import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gaming_app/model/games_model.dart';

Future<List<GamesModel>> getGames(String sortBy) async {
  final response = await http
      .get(Uri.parse('https://www.freetogame.com/api/games?sort-by=$sortBy'));
  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData
        .map<GamesModel>((jsonGame) => GamesModel.fromMap(jsonGame))
        .toList();
  } else {
    throw Exception('Failed to load games');
  }
}