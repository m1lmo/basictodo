import 'package:basictodo/view/home_view.dart';
import 'package:basictodo/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

class OnBoardView extends StatefulWidget {
  OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final HomeViewModel _homeViewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _homeViewModel.init();
    await Navigator.of(context).pushReplacement(MaterialPageRoute<Widget>(
      builder: (context) {
        return HomeView(homeViewModel: _homeViewModel);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<StatefulWidget>(
                    builder: (context) {
                      return HomeView(
                        homeViewModel: _homeViewModel,
                      );
                    },
                  ));
                },
                icon: Icon(Icons.navigate_next_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}
