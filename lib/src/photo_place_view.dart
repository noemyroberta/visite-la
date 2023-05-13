import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'photo_place_item.dart';
import 'repository/request_repository.dart';

class PhotoPlaceView extends StatelessWidget {
  PhotoPlaceView({
    super.key,
    required this.placesId,
    required this.index,
    required String apiKey,
  }) : _apiKey = apiKey;

  final List<String?> placesId;
  final int index;
  final String _apiKey;
  final _placeDetailRepository = PlaceDetailsRepository(Dio());

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(12.0),
      children: [
        const SizedBox(height: 20.0),
        FutureBuilder(
          future: _placeDetailRepository.findDetailsByPlaceId(
              placesId[index]!, _apiKey),
          builder: (_, snapshot) {
            String? photo = snapshot.data?.result?.photos?[0].photoReference;

            if (!snapshot.hasData) {
              return const SizedBox();
            }

            return PhotoPlaceItem(
              photo: photo,
              name: '${snapshot.data!.result!.name}',
              rating: snapshot.data!.result!.rating,
              apiKey: _apiKey,
            );
          },
        ),
      ],
    );
  }
}
