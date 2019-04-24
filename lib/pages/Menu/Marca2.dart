import 'package:flutter/material.dart';

class Marca2 {
  const Marca2({
    @required this.id,
    @required this.name,
    @required this.logo,
  })  : assert(id != null),
        assert(name != null),
        assert(logo != null);
  final String id;
  final String name;
  final String logo;
  Marca2 copyWith({
    String id,
    String name,
    String logo,
  }) {
    return Marca2(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo
    );
  }
}
