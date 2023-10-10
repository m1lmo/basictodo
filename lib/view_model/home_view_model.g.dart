// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$textEditingControllerAtom =
      Atom(name: '_HomeViewModelBase.textEditingController', context: context);

  @override
  TextEditingController get textEditingController {
    _$textEditingControllerAtom.reportRead();
    return super.textEditingController;
  }

  @override
  set textEditingController(TextEditingController value) {
    _$textEditingControllerAtom.reportWrite(value, super.textEditingController, () {
      super.textEditingController = value;
    });
  }

  late final _$todosAtom = Atom(name: '_HomeViewModelBase.todos', context: context);

  @override
  ObservableList<TodoModel> get todoList {
    _$todosAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableList<TodoModel> value) {
    _$todosAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  late final _$_todoModelAtom = Atom(name: '_HomeViewModelBase._todoModel', context: context);

  @override
  TodoModel? get _todoModel {
    _$_todoModelAtom.reportRead();
    return super._todoModel;
  }

  @override
  set _todoModel(TodoModel? value) {
    _$_todoModelAtom.reportWrite(value, super._todoModel, () {
      super._todoModel = value;
    });
  }

  late final _$isLoadingAtom = Atom(name: '_HomeViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isDoneAtom = Atom(name: '_HomeViewModelBase.isDone', context: context);

  @override
  bool get isDone {
    _$isDoneAtom.reportRead();
    return super.isDone;
  }

  @override
  set isDone(bool value) {
    _$isDoneAtom.reportWrite(value, super.isDone, () {
      super.isDone = value;
    });
  }

  late final _$initAsyncAction = AsyncAction('_HomeViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void toggleLoading() {
    final _$actionInfo =
        _$_HomeViewModelBaseActionController.startAction(name: '_HomeViewModelBase.toggleLoading');
    try {
      return super.toggleLoading();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleCheck(int index) {
    final _$actionInfo =
        _$_HomeViewModelBaseActionController.startAction(name: '_HomeViewModelBase.toggleCheck');
    try {
      return super.toggleCheck(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? getTime(int index) {
    final _$actionInfo =
        _$_HomeViewModelBaseActionController.startAction(name: '_HomeViewModelBase.getTime');
    try {
      return super.getTime(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodos(String? title, DateTime? time) {
    final _$actionInfo =
        _$_HomeViewModelBaseActionController.startAction(name: '_HomeViewModelBase.addTodos');
    try {
      return super.addTodos(title, time);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Text getTasks(int index) {
    final _$actionInfo =
        _$_HomeViewModelBaseActionController.startAction(name: '_HomeViewModelBase.getTasks');
    try {
      return super.getTasks(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  T containerWatcher<T>(int index) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.containerWatcher<T>');
    try {
      return super.containerWatcher<T>(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget buildListViewCard(int index) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.buildListViewCard');
    try {
      return super.buildListViewCard(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textEditingController: ${textEditingController},
todos: ${todoList},
isLoading: ${isLoading},
isDone: ${isDone}
    ''';
  }
}
