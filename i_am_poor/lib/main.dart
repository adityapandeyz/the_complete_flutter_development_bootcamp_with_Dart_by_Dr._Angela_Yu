import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('I am poor!'),
        ),
        body: Center(
          child: Image.asset(
              'assets/images/vecteezy_the-poor-businessman-shows-off-his-empty-trouser-pocket_5607828.jpg'),
        ),
      ),
    );
  }
}



