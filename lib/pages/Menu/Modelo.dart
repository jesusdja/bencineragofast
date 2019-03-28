import 'package:flutter/material.dart';

class Modelo {
  const Modelo({
    @required this.id,
    @required this.name,
  })  : assert(id != null),
        assert(name != null);
  final String id;
  final String name;
  Modelo copyWith({
    String id,
    String name,
  }) {
    return Modelo(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
