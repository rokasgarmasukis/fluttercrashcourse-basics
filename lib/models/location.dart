import 'package:hello_world/models/location_fact.dart';

class Location {
  final String name;
  final String url;
  final List<LocationFact>? facts;
  Location({required this.name, required this.url, this.facts});
}