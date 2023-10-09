import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:softdesign_marvel/src/domain/entity/comics.dart';
import 'package:softdesign_marvel/src/presenter/home/components/custom_shimmer.dart';

class ListComic extends StatelessWidget {
  final List<Comic> comics;
  final bool isLoading;

  const ListComic(
    this.comics, {
    this.isLoading = false,
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
        isLoading
            ? CustomShimmer.list(
                length: 10,
                height: 280,
                width: 40,
                baseColor: Colors.red,
                highlightColor: Colors.black,
              )
            : SizedBox(
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
                          child: CachedNetworkImage(
                            imageUrl: comics[index].thumbnail,
                            placeholder: (_, __) => const CustomShimmer(
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
