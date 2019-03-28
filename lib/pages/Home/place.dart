import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  const Place({
    @required this.id,
    @required this.address,
    @required this.latLng,
    @required this.brand,
    @required this.prices,
    @required this.last_price_update,
    @required this.services,
    @required this.favorito,
  })  : assert(id != null),
        assert(address != null),
        assert(latLng != null),
        assert(brand != null),
        assert(prices != null),
        assert(last_price_update != null),
        assert(services != null),
        assert(favorito != null);

  final int id;
  final String address;
  final LatLng latLng;
  final String brand;
  final List<List<String>> prices;
  final String last_price_update;
  final List<String> services;
  final bool favorito;

  double get latitude => latLng.latitude;
  double get longitude => latLng.longitude;

  Place copyWith({
    int id,
    String address,
    LatLng latLng,
    String brand,
    List<List<String>> prices,
    String last_price_update,
    List<String> services,
    bool favorito,
  }) {
    return Place(
      id: id ?? this.id,
      address: address ?? this.address,
      latLng: latLng ?? this.latLng,
      brand: brand ?? this.brand,
      prices: prices ?? this.prices,
      last_price_update: last_price_update ?? this.last_price_update,
      services: services ?? this.services,
      favorito: favorito ?? this.favorito,
    );
  }
}
