import 'dart:convert';
import 'package:flutter/services.dart';

Future<String> getKey() async {
  String jsonString = await rootBundle.loadString('assets/keys.json');
  Map<String, dynamic> jsonMap = json.decode(jsonString);

  return jsonMap['API_KEY'];
}