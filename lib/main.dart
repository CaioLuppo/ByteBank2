import 'package:flutter/material.dart';

// screens
import 'screens/dashboard.dart';


void main() {
  runApp(const ByteBank());
}

class ByteBank extends StatelessWidget {
  const ByteBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        colorSchemeSeed: Colors.green[900],
        brightness: Brightness.light,

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueAccent[700]
        )
      ),

      home: const Dashboard(),
    );
  }
}
