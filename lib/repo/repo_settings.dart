import 'package:shared_preferences/shared_preferences.dart';

class RepoSettings {
  RepoSettings._();
  static final _instance = RepoSettings._();
  factory RepoSettings() => _instance;

  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> saveLocale(String locale) async {
    if (prefs == null) return false;
    return prefs?.setString('locale', locale);
  }

  Future<String?> readLocale() async {
    if (prefs == null) return null;
    return prefs?.getString('locale');
  }
}
