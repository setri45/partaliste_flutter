import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';

import 'home_page.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    main();
    return MaterialApp(
      title: 'PartaListe',
      theme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
