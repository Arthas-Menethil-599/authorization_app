// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru_RU locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru_RU';

  static String m0(total) => "Всего персонажей: ${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alive": MessageLookupByLibrary.simpleMessage("Живой"),
        "allCharacters": m0,
        "auth": MessageLookupByLibrary.simpleMessage("Авторизация"),
        "characters": MessageLookupByLibrary.simpleMessage("Персонажи"),
        "charactersListIsEmpty":
            MessageLookupByLibrary.simpleMessage("Персонажей не найдено"),
        "close": MessageLookupByLibrary.simpleMessage("Закрыть"),
        "counterValue":
            MessageLookupByLibrary.simpleMessage("Значение счетчика"),
        "create": MessageLookupByLibrary.simpleMessage("Создать"),
        "dead": MessageLookupByLibrary.simpleMessage("Мертвый"),
        "dontHaveAnAccountHint":
            MessageLookupByLibrary.simpleMessage("У вас все еще нет аккаунта"),
        "english": MessageLookupByLibrary.simpleMessage("Английский"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
        "female": MessageLookupByLibrary.simpleMessage("Женский"),
        "homeScreen": MessageLookupByLibrary.simpleMessage("Домашний экран"),
        "inputErrorCheckLogin":
            MessageLookupByLibrary.simpleMessage("Проверьте логин"),
        "inputErrorCheckPassword":
            MessageLookupByLibrary.simpleMessage("Проверьте пароль"),
        "inputErrorLoginIsShort": MessageLookupByLibrary.simpleMessage(
            "Логин должен содержать не менее 3 символов"),
        "inputErrorPasswordIsShort": MessageLookupByLibrary.simpleMessage(
            "Пароль должен содержать не менее 8 символов"),
        "inputLoginAndPassword":
            MessageLookupByLibrary.simpleMessage("Введите логин и пароль"),
        "language": MessageLookupByLibrary.simpleMessage("Язык"),
        "login": MessageLookupByLibrary.simpleMessage("Логин"),
        "male": MessageLookupByLibrary.simpleMessage("Мужской"),
        "man": MessageLookupByLibrary.simpleMessage("Человек"),
        "noData": MessageLookupByLibrary.simpleMessage("Неизвестно"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "russian": MessageLookupByLibrary.simpleMessage("Русский"),
        "searchCharacter":
            MessageLookupByLibrary.simpleMessage("Найти персонажа"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "signIn": MessageLookupByLibrary.simpleMessage("Вход"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так :-("),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Попробуйте снова"),
        "wrongLoginOrPassword": MessageLookupByLibrary.simpleMessage(
            "Введен неверный логин или пароль")
      };
}
