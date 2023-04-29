import 'package:dio/dio.dart';
import 'package:dotenv/dotenv.dart';
import 'package:flutter/material.dart';
import 'package:visite_la/src/repository/request_repository.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = LocationRepository(Dio());
    final env = DotEnv(includePlatformEnvironment: true)..load();

    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: repo.findLocationByAddress(
            'Arapiraca+,+AL',
            env['API_KEY']!,
          ),
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final location = snapshot.data!.results![0].geometry!.location;
            return Column(
              children: [
                Text('${location!.lat}'),
                Text('${location.lng}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
