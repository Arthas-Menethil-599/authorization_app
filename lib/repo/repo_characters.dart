import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/character.dart';
import '../generated/l10n.dart';

class RepoCharacters {
  Future<ResultRepoCharacters> readCharacters() async {
    try {
      final url = Uri.parse('https://rickandmortyapi.com/api/character');
      final result = await http.get(url);
      final data = jsonDecode(result.body);
      final charactersListJson = data['results'] as List;
      final charactersList = charactersListJson
          .map(
            (item) => Character.fromJson(item),
          )
          .toList();
      return ResultRepoCharacters(charactersList: charactersList);
    } catch (error) {
      print('🏐 Error : $error');
      return ResultRepoCharacters(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }
}

class ResultRepoCharacters {
  ResultRepoCharacters({
    this.errorMessage,
    this.charactersList,
  });

  final String? errorMessage;
  final List<Character>? charactersList;
}
