import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  const Place({
    @required this.id,
    @required this.address,
    @required this.latLng,
    @required this.brand,
    @required this.prices,
    @required this.tiposgas,
    @required this.last_price_update,
    @required this.services,
    @required this.marca,
    @required this.favorito,
    @required this.OpenHr,
    @required this.image,
  })  : assert(id != null),
        assert(address != null),
        assert(latLng != null),
        assert(brand != null),
        assert(prices != null),
        assert(tiposgas != null),
        assert(last_price_update != null),
        assert(services != null),
        assert(marca != null),
        assert(favorito != null),
        assert(OpenHr != null),
        assert(image != null);

  final int id;
  final String address;
  final LatLng latLng;
  final String brand;
  final List<String> prices;
  final List<String> tiposgas;
  final String last_price_update;
  final List<String> services;
  final String marca;
  final bool favorito;
  final String OpenHr;
  final String image;

  double get latitude => latLng.latitude;
  double get longitude => latLng.longitude;

  Place copyWith({
    int id,
    String address,
    LatLng latLng,
    String brand,
    List<String> prices,
    List<String> tiposgas,
    String last_price_update,
    List<String> services,
    String marca,
    bool favorito,
    String OpenHr,
    String image,
  }) {
    return Place(
      id: id ?? this.id,
      address: address ?? this.address,
      latLng: latLng ?? this.latLng,
      brand: brand ?? this.brand,
      prices: prices ?? this.prices,
      tiposgas: tiposgas ?? this.tiposgas,
      last_price_update: last_price_update ?? this.last_price_update,
      services: services ?? this.services,
      marca: marca ?? this.marca,
      favorito: favorito ?? this.favorito,
      OpenHr: OpenHr ?? this.OpenHr,
      image: image ?? this.image,
    );
  }
}
