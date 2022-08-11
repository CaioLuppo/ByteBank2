import 'package:flutter/material.dart';

class Progress extends StatelessWidget {

  final String message;

  Progress({this.message = "Loading"});

  @override
  Widget build(BuildContext context) {
    return Center( // loading
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(message),
          )
        ],
      ),
    );;
  }
}
