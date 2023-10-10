import 'package:basictodo/product/constants/project_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  late final SharedPreferences prefs;
  SharedManager();
  static SharedManager? instance;
  SharedManager._singleton();

  static Future<SharedManager> get getInstance async {
    if (instance == null) {
      instance = SharedManager._singleton();
      await instance!.init();
    }
    return instance!;
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void>? writeListData(List<String>? items) async {
    await prefs.setStringList(ProjectStrings.cacheKeyForTodoModel, items ?? []);
  }

  List<String>? readListData() {
    final List<String>? items = prefs.getStringList(ProjectStrings.cacheKeyForTodoModel);
    return items ?? [];
  }

  Future<void> removeDatas() async {
    await prefs.remove(ProjectStrings.cacheKeyForTodoModel);
  }
}
