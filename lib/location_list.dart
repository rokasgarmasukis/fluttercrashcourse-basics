import 'package:flutter/material.dart';
import 'package:hello_world/app.dart';
import 'location_detail.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;

  const LocationList({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Locations",
          style: Styles.navBarTitle,
        ),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: _listViewItemBuilder,
      ),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var location = locations[index];
    return ListTile(
      contentPadding: const EdgeInsets.all(10.0),
      leading: _itemThumbnail(location),
      title: _itemTitle(location),
      onTap: () {
        _navigateToLocationDetail(context, index);
      },
    );
  }

  void _navigateToLocationDetail(BuildContext context, int locationID) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationDetail(locationID: locationID),
        ));
  }

  Widget _itemThumbnail(Location location) {
    return Container(
      constraints: const BoxConstraints.tightFor(width: 100.0),
      child: Image.network(location.url, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(Location location) {
    return Text(
      location.name,
      style: Styles.textDefault,
    );
  }
}
