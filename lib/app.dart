import 'package:flutter/material.dart';
import 'package:hello_world/location_detail.dart';
import 'package:hello_world/location_list.dart';
import './models/location.dart';
import './mocks/mock_location.dart';

class App extends StatelessWidget {
  final Location mockLocation = MockLocation.fetchAny();
  final List<Location> mockLocations = MockLocation.fetchAll();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationList(locations: mockLocations),
    );
  }
}
