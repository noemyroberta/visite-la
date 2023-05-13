import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageLoaderWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const ImageLoaderWidget({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: imageUrl.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              width: width,
              height: height,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                value: downloadProgress.progress,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )
          : Container(
              color: Colors.black12,
              height: height,
              width: width,
              child: const Center(
                child: Text(
                  'Nenhuma imagem disponível',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ubuntu',
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
