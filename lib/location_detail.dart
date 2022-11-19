import 'package:flutter/material.dart';
import 'mocks/mock_location.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationDetail extends StatelessWidget {
  final int locationID;

  const LocationDetail({super.key, required this.locationID});

  @override
  Widget build(BuildContext context) {
    var location = MockLocation.fetch(locationID);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(location.name),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, location),
        ),
      ),
    );
  }

  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = <Widget>[];
    result.add(_bannerImage(location.url, 170.0));
    result.addAll(_renderFacts(context, location));
    return result;
  }

  List<Widget> _renderFacts(BuildContext context, Location location) {
    var result = <Widget>[];
    location.facts?.forEach((fact) {
      result.add(_sectionTitle(fact.title));
      result.add(_sectionText(fact.text));
    });
    return result;
  }

  Widget _sectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: Styles.headerLarge,
      ),
    );
  }

  Widget _sectionText(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
      child: Text(
        text,
        style: Styles.textDefault,
      ),
    );
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(url, fit: BoxFit.fitWidth),
    );
  }
}
