import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
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
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          if (kDebugMode) {
            print(snapshot.error);
          }
          return Error();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
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

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }

  // Loading widget
  Widget Loading() {
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
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Chargement',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Veuillez patienter pendant le chargement de l\'application.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Error widget
  Widget Error() {
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
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Erreur',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Une erreur est survenue, veuillez rafrachir la page.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Image(
                image: AssetImage('assets/images/cpt.gif'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
