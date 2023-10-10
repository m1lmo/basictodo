import 'dart:convert';

import 'package:basictodo/model/todo_model.dart';
import 'package:basictodo/product/cache/shared_manager.dart';
import 'package:mobx/mobx.dart';

class TodoCacheManager {
  TodoCacheManager(this.sharedManager);
  late final SharedManager sharedManager;

  Future<void> removeDatas() async {
    await sharedManager.removeDatas();
  }

  Future<void> writetodoListData(List<TodoModel>? todoModel) async {
    final items = todoModel?.map((e) => jsonEncode(e.toJson())).toList();
    await sharedManager.writeListData(items);
  }

  //bunu eklediğimde uygulama yeniden başladığında ilk girdiğim veri ekranda gözükmüyor listen değil
  ObservableList<TodoModel>? readTodoListData() {
    final itemString = sharedManager.readListData();
    if (itemString?.isNotEmpty ?? false) {
      final result = itemString?.map((e) {
        final json = jsonDecode(e);
        if (json is Map<String, dynamic>) {
          return TodoModel.fromJson(json);
        }
        return TodoModel();
      });
      return ObservableList<TodoModel>.of(result ?? []);
    }
    return null;
  }
}
