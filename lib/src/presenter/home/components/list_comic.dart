import 'package:flutter/material.dart';
import 'package:softdesign_marvel/src/domain/entity/comics.dart';

class ListComic extends StatelessWidget {
  final List<Comic> comics;

  const ListComic(
    this.comics, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Comics',
        
         
        ),
        const Divider(
          thickness: 2,
          height: 20,
          color: Colors.white,
        ),
        SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, index) => const SizedBox(width: 25),
            itemCount: comics.length,
            itemBuilder: (_, index) => SizedBox(
              width: 120,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(4),
                    child: Image.network(comics[index].thumbnail),
                  ),
                  Text(
                    comics[index].title,
                    
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
