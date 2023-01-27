import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String data = 'Top Secret Data';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(''),
          ),
          body: Level1(
            data: data,
          ),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  final String data;
  const Level1({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Level2(
      data: data,
    );
  }
}

class Level2 extends StatelessWidget {
  final String data;

  const Level2({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        MyTextField(),
        Level3(
          data: data,
        ),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  final String data;

  const Level3({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<DataProvider>(context);

    return Text(providerData._data);
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<DataProvider>(context, listen: false).data(newText);
      },
    );
  }
}

class DataProvider extends ChangeNotifier {
  String _data = 'some data';

  void data(String newData) {
    _data = newData;
    notifyListeners();
  }
}
