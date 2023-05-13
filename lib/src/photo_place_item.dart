import 'package:flutter/material.dart';

import 'image_loader.dart';

class PhotoPlaceItem extends StatelessWidget {
  const PhotoPlaceItem({
    Key? key,
    required this.photo,
    required this.name,
    required this.rating,
    required this.apiKey,
  }) : super(key: key);

  final String? photo;
  final String? name;
  final double? rating;
  final String apiKey;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        ImageLoaderWidget(
          imageUrl: photo != null
              ? 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$photo&key=$apiKey'
              : '',
          width: 200.0,
          height: 200.0,
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$name",
              style: const TextStyle(
                color: Colors.amber,
                fontFamily: 'Ubuntu',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Color(0xFF84BF49),
                  size: 18.0,
                ),
                const SizedBox(width: 6.0),
                Text(
                  "${rating ?? 5.0}",
                  style: const TextStyle(
                    color: Colors.amber,
                    fontFamily: 'Ubuntu',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
