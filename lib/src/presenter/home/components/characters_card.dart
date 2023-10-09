import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:softdesign_marvel/src/domain/entity/character.dart';
import 'package:softdesign_marvel/src/presenter/home/components/custom_shimmer.dart';

class CharactersCard extends StatelessWidget {
  final Character character;
  final Function goDetail;

  const CharactersCard(
    this.character, {
    required this.goDetail,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goDetail(),
      child: Card(
        color: Colors.black,
        child: Column(
          children: [
            LimitedBox(
              maxHeight: 130,
              child: CachedNetworkImage(
                imageUrl: character.thumbnail!,
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
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                character.name!,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
