part of 'bloc_characters.dart';

abstract class StateBlocCharacters {}

class StateCharactersInitial extends StateBlocCharacters {}

class StateCharactersLoading extends StateBlocCharacters {}

class StateCharactersError extends StateBlocCharacters {
  StateCharactersError(this.error);

  final String error;
}

class StateCharactersData extends StateBlocCharacters {
  StateCharactersData({
    required this.data,
  });

  final List<Character> data;
}
