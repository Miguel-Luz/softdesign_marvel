import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:softdesign_marvel/src/domain/entity/character.dart';
import 'package:softdesign_marvel/src/presenter/home/components/custom_shimmer.dart';
import 'package:softdesign_marvel/src/presenter/home/components/list_comic.dart';
import 'package:softdesign_marvel/src/presenter/home/home_store.dart';
import 'package:softdesign_marvel/src/service_locator.dart';

class HomeDetailScreen extends StatefulWidget {
  final Character character;

  const HomeDetailScreen(
    this.character, {
    super.key,
  });

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  final HomeStore _homeStore = locator.get<HomeStore>();

  @override
  void initState() {
    super.initState();
    _homeStore.getComics(widget.character.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.character.name!,
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          LimitedBox(
            maxHeight: 250,
            child: CachedNetworkImage(
              imageUrl: widget.character.thumbnail!,
              placeholder: (context, url) => const CustomShimmer(
                height: 150,
                width: double.infinity,
                baseColor: Colors.red,
                highlightColor: Colors.black,
              ),
              errorWidget: (_, __, ___) => SizedBox(
                height: 150,
                child: Image.asset(
                  'assets/images/logo_marvel.png',
                  width: 50,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14.0,
              horizontal: 12,
            ),
            child: Text(
              widget.character.description!,
              
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 350),
            child: Observer(builder: (_) {
              return ListComic(
                _homeStore.comics,
                isLoading: _homeStore.isLoadingComics,
              );
            }),
          )
        ],
      ),
    );
  }
}
