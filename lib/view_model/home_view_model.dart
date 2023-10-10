import 'package:basictodo/model/todo_model.dart';
import 'package:basictodo/product/cache/shared_manager.dart';
import 'package:basictodo/product/cache/todo_cache_manager.dart';
import 'package:basictodo/product/constants/project_strings.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  late final TodoCacheManager todoCacheManager;
  @observable
  TextEditingController textEditingController = TextEditingController();
  @observable
  ObservableList<TodoModel> todoList = ObservableList<TodoModel>.of([]);
  @observable
  TodoModel? _todoModel;
  @observable
  bool isLoading = false;
  @observable
  bool isDone = false;

  @action
  void toggleLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> init() async {
    toggleLoading();
    todoCacheManager = TodoCacheManager(await SharedManager.getInstance);
    todoList = todoCacheManager.readTodoListData() ?? ObservableList<TodoModel>.of([]);
    toggleLoading();
  }

  @action
  void toggleCheck(int index) {
    isDone = todoList[index].isDone ?? false;
    todoList[index].isDone = !isDone;
  }

  void removeDatas() {
    todoCacheManager.removeDatas();
  }

  @action
  String? getTime(int index) {
    final times = todoList[index].time;
    if (times == null) return null;
    String timesStr = '${times.hour}:${times.minute}';
    return timesStr;
  }

  @action
  void addTodos(String? title, DateTime? time) {
    toggleLoading();
    _todoModel = TodoModel(title: title, time: time, isDone: isDone);
    todoList.add(_todoModel!);
    toggleLoading();
  }

  @action
  Text getTasks(int index) {
    if (todoList[index].isDone == null) return Text(todoList[index].title ?? '');
    return todoList[index].isDone!
        ? Text(todoList[index].title ?? '',
            style: TextStyle(decoration: TextDecoration.lineThrough))
        : Text(todoList[index].title ?? '');
  }

  /// this methods T type have to be Icon Or Color dont change
  @action
  T containerWatcher<T>(int index) {
    if (T == Icon) {
      return todoList[index].isDone == true ? Icon(Icons.check) as T : Icon(null) as T;
    } else if (T == Color) {
      return todoList[index].isDone == true ? Colors.green as T : Colors.white as T;

      // return getColor;
    }
    return throw Exception(ProjectStrings.unsupportedTypeExceptionTitle);
  }

  @action
  Widget buildListViewCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: containerWatcher<Color>(index),
        border: Border.all(width: 0.5),
        shape: BoxShape.circle,
      ),
      child: containerWatcher<Icon>(index),
    );
  }

  void showadtaskBottomSheet(
    BuildContext context,
    Widget Function(BuildContext) builder,
  ) {
    showModalBottomSheet<Widget>(
      context: context,
      builder: builder,
    );
  }
}
