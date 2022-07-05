import 'package:authorization_app/repo/repo_characters.dart';
import 'package:flutter/material.dart';
import '../../../dto/character.dart';

class CharactersListVModel with ChangeNotifier {
  CharactersListVModel({required this.repo}) {
    _init();
  }

  String? errorMessage;
  List<Character> filteredList = <Character>[];
  bool isListView = true;
  var isLoading = true;
  final RepoCharacters repo;

  var _charactersList = <Character>[];

  void _init() {
    repo.readCharacters().then((result) {
      errorMessage = result.errorMessage;
      _charactersList = result.charactersList ?? <Character>[];
      filteredList = _charactersList;
      isLoading = false;
      notifyListeners();
    });
  }

  void filter(String query) {
    filteredList = _charactersList.where((element) {
      if (element.name == null) return false;
      final name = element.name!.toLowerCase();
      return name.contains(query);
    }).toList();
    notifyListeners();
  }

  void switchView() {
    isListView = !isListView;
    notifyListeners();
  }
}
