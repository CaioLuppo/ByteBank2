import 'package:flutter/material.dart';

// screens
import 'screens/dashboard.dart';

void main() {
  runApp(ByteBank());
}

class ByteBank extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 27, 94, 32),
          brightness: Brightness.light,
          secondary: Colors.blueAccent[700],
        ),
      ),
      darkTheme: ThemeData(
        // primaryColor: Colors.green[900],
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 27, 94, 32),
          brightness: Brightness.dark,
          primary: Colors.green[900],
          onPrimary: Colors.white,
          secondary: Colors.blueAccent[700],
          onSecondary: Colors.white,
        ),
      ),
      home: const Dashboard(),
    );
  }
}
