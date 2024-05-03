import 'package:flutter/material.dart';
import 'package:indah_ki/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '227006059_Indah Robiatul A',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const Home(title: 'AES Cryptography Algorithm'),
    );
  }
}
