import 'package:flutter/material.dart';
import 'src/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VisiteLaApp());
}

class VisiteLaApp extends StatelessWidget {
  const VisiteLaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VisiteLá',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
