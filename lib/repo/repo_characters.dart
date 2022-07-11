import '../dto/character.dart';
import '../generated/l10n.dart';
import 'api.dart';

class RepoCharacters {
  RepoCharacters({required this.api});

  final Api api;

  Future<ResultRepoCharacters> filterByName(String name) async {
    try {
      final result = await api.dio.get('/character/', queryParameters: {
        "name": name,
      });

      final List charactersListJson = result.data['results'] ?? [];
      final charactersList = charactersListJson
          .map(
            (item) => Character.fromJson(item),
          )
          .toList();
      return ResultRepoCharacters(charactersList: charactersList);
    } catch (error) {
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
