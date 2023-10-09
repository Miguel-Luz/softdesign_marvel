import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  final Color? baseColor;
  final Color? highlightColor;

  final BorderRadius? borderRadius;

  const CustomShimmer({
    Key? key,
    required this.height,
    required this.width,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 500),
        baseColor: baseColor ?? Colors.grey.shade800,
        highlightColor: highlightColor ?? Colors.grey.shade500,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(50),
          ),
        ),
      ),
    );
  }

  CustomShimmer.list({
    super.key,
    required this.height,
    required this.width,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
    required int length,
  }) {
    ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (_, index) => const SizedBox(width: 100),
      itemCount: length,
      itemBuilder: (_, index) => SizedBox(
        width: width,
        height: height,
        child: Shimmer.fromColors(
          period: const Duration(milliseconds: 1500),
          baseColor: baseColor ?? Colors.grey.shade800,
          highlightColor: highlightColor ?? Colors.grey.shade500,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(50),
            ),
          ),
        ),
      ),
    );
  }
}
