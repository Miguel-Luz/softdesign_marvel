import 'package:flutter/material.dart';
import 'package:softdesign_marvel/src/domain/entity/character.dart';

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
              child: Image.network(
                character.thumbnail,
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
            Text(
              character.name,
            )
          ],
        ),
      ),
    );
  }
}
