import 'package:authorization_app/dto/character.dart';
import 'package:authorization_app/repo/repo_characters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events.dart';
part 'states.dart';

class BlocCharacters extends Bloc<EventBlocCharacters, StateBlocCharacters> {
  BlocCharacters({required this.repo}) : super(StateCharactersInitial()) {
    on<EventCharactersFilterByName>(
      (event, emit) async {
        emit(StateCharactersLoading());
        final result = await repo.filterByName(event.name);
        if (result.errorMessage != null) {
          emit(
            StateCharactersError(result.errorMessage!),
          );
          return;
        }
        emit(
          StateCharactersData(data: result.charactersList!),
        );
      },
    );
  }

  final RepoCharacters repo;
}
