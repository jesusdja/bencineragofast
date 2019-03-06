import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  const Place({
    @required this.id,
    @required this.latLng,
    @required this.name,
    this.description,
  })  : assert(id != null),
        assert(latLng != null),
        assert(name != null);

  final String id;
  final LatLng latLng;
  final String name;
  final String description;

  double get latitude => latLng.latitude;
  double get longitude => latLng.longitude;

  Place copyWith({
    String id,
    LatLng latLng,
    String name,
    String description,
  }) {
    return Place(
      id: id ?? this.id,
      latLng: latLng ?? this.latLng,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}