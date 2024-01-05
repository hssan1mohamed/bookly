import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child:imageUrl==null? null : CachedNetworkImage(
              imageUrl: imageUrl!,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) {
                return const Center(child: Icon(Icons.error));
              },
            ),
          )),
    );
  }
}
