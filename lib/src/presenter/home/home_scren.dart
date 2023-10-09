import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:softdesign_marvel/src/presenter/home/components/characters_card.dart';
import 'package:softdesign_marvel/src/presenter/home/home_store.dart';
import 'package:softdesign_marvel/src/service_locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeStore _homeStore = locator.get<HomeStore>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    _homeStore.fetch();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _homeStore.fetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.asset(
            'assets/images/logo_marvel.png',
            width: 50,
          ),
        ),
        backgroundColor: Colors.black,
        body: Observer(builder: (_) {
          return GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: _homeStore.characters.length,
              itemBuilder: (_, index) {
                return CharactersCard(
                  _homeStore.characters[index],
                  goDetail: () => context.push(
                    '/detail/${_homeStore.characters[index].id}',
                    extra: {'character': _homeStore.characters[index]},
                  ),
                );
              });
        }),
        bottomNavigationBar: Observer(
          builder: (context) => Visibility(
            visible: _homeStore.isLoading,
            child: const LinearProgressIndicator(
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation(Colors.red),
              minHeight: 10,
            ),
          ),
        ),
      ),
    );
  }
}
