import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:softdesign_marvel/src/domain/entity/character.dart';
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
    _homeStore.getComics(widget.character.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.character.name,
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          LimitedBox(
            maxHeight: 250,
            child: Image.network(
              widget.character.thumbnail,
              fit: BoxFit.fitHeight,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                );
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const SizedBox.shrink();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'cod: ${widget.character.id.toString()}',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.character.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.character.description,
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 350),
            child: Observer(builder: (_) {
              return ListComic(_homeStore.comics);
            }),
          )
        ],
      ),
    );
  }
}
