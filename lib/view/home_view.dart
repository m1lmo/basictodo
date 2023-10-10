// ignore_for_file: public_member_api_docs

import 'package:basictodo/model/todo_model.dart';
import 'package:basictodo/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.homeViewModel});
  final HomeViewModel homeViewModel;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final HomeViewModel _homeViewModel = widget.homeViewModel;
  late final AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Observer(
            builder: (_) {
              return _homeViewModel.isLoading
                  ? const CircularProgressIndicator()
                  : const SizedBox.shrink();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: _MySearchDelegate(
                        _homeViewModel,
                        navigateBackButton: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        onPressed: (index) {
                          setState(() {});
                          _homeViewModel.toggleCheck(index);
                        },
                      ));
                },
                icon: const Icon(Icons.search)),
            _AddButton(homeViewModel: _homeViewModel)
          ],
        ),
        //todos fazla observerları sil
        floatingActionButton: Observer(
          builder: (_) {
            return _homeViewModel.todoList.isEmpty
                ? const SizedBox.shrink()
                : _RemoveButton(homeViewModel: _homeViewModel);
          },
        ),
        body: MyListViewBuilder(
            isSearchModeOn: false,
            items: _homeViewModel.todoList,
            homeViewModel: _homeViewModel,
            onPressed: (index) {
              setState(() {});
              _homeViewModel.toggleCheck(index);
            }));
  }
}

class _RemoveButton extends StatelessWidget {
  const _RemoveButton({
    super.key,
    required HomeViewModel homeViewModel,
  }) : _homeViewModel = homeViewModel;

  final HomeViewModel _homeViewModel;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Uyarı'),
              content: const Text(
                  'işleme devam ettiğinizde tüm görevleriniz silinecektir, devam etmek istiyor musunuz.'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Hayır')),
                TextButton(
                    onPressed: () {
                      _homeViewModel.todoCacheManager.sharedManager.removeDatas();
                      _homeViewModel.todoList.clear();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Evet',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            );
          },
        );
      },
      child: const Icon(Icons.playlist_remove_outlined),
    );
  }
}

class MyListViewBuilder extends StatelessWidget {
  const MyListViewBuilder({
    required HomeViewModel homeViewModel,
    required this.onPressed,
    required this.items,
    required this.isSearchModeOn,
    super.key,
  }) : _homeViewModel = homeViewModel;
  final bool isSearchModeOn;
  final HomeViewModel _homeViewModel;
  final void Function(int index) onPressed;
  final List<TodoModel> items;

  @override
  Widget build(BuildContext context) {
    if (isSearchModeOn == false) {
      return Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: ValueKey<TodoModel>(items[index]),
                onDismissed: (_) {
                  _homeViewModel.todoList.removeAt(index);
                  _homeViewModel.todoCacheManager.writetodoListData(_homeViewModel.todoList);
                },
                child: Card(
                  child: ListTile(
                    leading: IconButton(
                      icon: _homeViewModel.buildListViewCard(index),
                      onPressed: () {
                        onPressed(index);
                        _homeViewModel.todoCacheManager.writetodoListData(_homeViewModel.todoList);
                      },
                    ),
                    title: _homeViewModel.getTasks(index),
                  ),
                ),
              );
            },
          );
        },
      );
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey<TodoModel>(items[index]),
          onDismissed: (_) {
            _homeViewModel.todoList.removeAt(index);
            _homeViewModel.todoCacheManager.writetodoListData(_homeViewModel.todoList);
          },
          child: Card(
            child: ListTile(
              leading: IconButton(
                icon: _homeViewModel.buildListViewCard(index),
                onPressed: () {
                  onPressed(index);
                  _homeViewModel.todoCacheManager.writetodoListData(_homeViewModel.todoList);
                },
              ),
              title: _homeViewModel.getTasks(index),
              trailing: Text(_homeViewModel.getTime(index) ?? ''),
            ),
          ),
        );
      },
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({
    super.key,
    required HomeViewModel homeViewModel,
  }) : _homeViewModel = homeViewModel;
  final HomeViewModel _homeViewModel;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _homeViewModel.showadtaskBottomSheet(
          context,
          (_) {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: TextField(
                controller: _homeViewModel.textEditingController,
                onEditingComplete: () {
                  _homeViewModel.addTodos(
                      _homeViewModel.textEditingController.text, DateTime.now());
                  _homeViewModel.todoCacheManager.writetodoListData(_homeViewModel.todoList);
                  _homeViewModel.textEditingController.clear();
                  Navigator.pop(context);
                },
              ),
            );
          },
        );
      },
      icon: const Icon(
        Icons.add,
      ),
    );
  }
}

class _MySearchDelegate extends SearchDelegate<String> {
  _MySearchDelegate(
    this._homeViewModel, {
    required this.onPressed,
    required this.navigateBackButton,
  });
  late final HomeViewModel _homeViewModel;
  final void Function(int) onPressed;
  final VoidCallback navigateBackButton;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return IconButton(onPressed: navigateBackButton, icon: const Icon(Icons.navigate_before));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final items = _homeViewModel.todoList.where((element) {
      final result = element.title!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return StatefulBuilder(builder: (context, setState) {
      return MyListViewBuilder(
          homeViewModel: _homeViewModel,
          onPressed: (index) {
            setState(() {});
            onPressed(index);
          },
          items: items,
          isSearchModeOn: true);
    });
  }
}
