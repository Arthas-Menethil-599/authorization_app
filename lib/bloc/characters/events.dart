part of 'bloc_characters.dart';

abstract class EventBlocCharacters {}

class EventCharactersReadAll extends EventBlocCharacters {}

class EventCharactersLoadNextPage extends EventBlocCharacters {}

class EventCharactersFilterByName extends EventBlocCharacters {
  EventCharactersFilterByName(this.name);

  final String name;
}
