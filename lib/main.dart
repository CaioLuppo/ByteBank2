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
        // primaryColor: Colors.green[900],
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 27, 94, 32),
          brightness: Brightness.light,
          secondary: Colors.blueAccent[700],

        )
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

      // theme: ThemeData(
      //   colorSchemeSeed: Colors.green[900],
      //   brightness: Brightness.light,
      //
      //   floatingActionButtonTheme: FloatingActionButtonThemeData(
      //     backgroundColor: Colors.blueAccent[700]
      //   ),
      //
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       primary: Colors.blueAccent[700],
      //     ),
      //   )
      // ),

      home: const Dashboard(),
    );
  }
}
