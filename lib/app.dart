import 'package:flutter/material.dart';
import 'package:hello_world/location_list.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationList(),
    );
  }
}

