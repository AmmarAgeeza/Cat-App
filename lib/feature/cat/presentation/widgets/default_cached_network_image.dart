import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultCachedNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double? iconSize;
  final double? padding;
  final String imageUrl;
  final BoxFit? fit;

  const DefaultCachedNetworkImage(
      {Key? key,
      this.height,
      required this.imageUrl,
      this.width,
      required this.fit,
      this.iconSize,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: fit,
        width: width,
        height: height,
        imageUrl: imageUrl,
        placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
        errorWidget: (context, url, error) => Padding(
              padding: EdgeInsets.all(padding ?? 35),
              child: const Icon(Icons.error),
            ));
  }
}
