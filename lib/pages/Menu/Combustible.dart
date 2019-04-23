import 'package:flutter/material.dart';

class Combustible {
  const Combustible({    @required this.id,
    @required this.name,
  })  : assert(id != null),
        assert(name != null);
  final String id;
  final String name;
  Combustible copyWith({
    String id,
    String name,
  }) {
    return Combustible(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
