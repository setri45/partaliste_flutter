import 'package:flutter/material.dart';

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
      home: const LoginPage(),
    );
  }
}
