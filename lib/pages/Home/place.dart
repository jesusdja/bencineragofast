import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  const Place({
    @required this.id,
    @required this.DiferenciaDist,
    @required this.latLng,
    @required this.TipoGas,
    @required this.name,
    this.description,
    this.marca,
    this.precio,
    this.favorito,
  })  : assert(id != null),
        assert(DiferenciaDist != null),
        assert(latLng != null),
        assert(TipoGas != null),
        assert(name != null);

  final int id;
  final double DiferenciaDist;
  final LatLng latLng;
  final String TipoGas;
  final String name;
  final String description;
  final String marca;
  final double precio;
  final bool favorito;

  double get latitude => latLng.latitude;
  double get longitude => latLng.longitude;

  Place copyWith({
    int id,
    double DiferenciaDist,
    LatLng latLng,
    String TipoGas,
    String name,
    String description,
    String marca,
    double precio,
    bool favorito,
  }) {
    return Place(
      id: id ?? this.id,
      DiferenciaDist: DiferenciaDist ?? this.DiferenciaDist,
      latLng: latLng ?? this.latLng,
      TipoGas: TipoGas ?? this.TipoGas,
      name: name ?? this.name,
      description: description ?? this.description,
      marca: marca ?? this.marca,
      precio: precio ?? this.precio,
     favorito: favorito ?? this.favorito,
    );
  }
}
