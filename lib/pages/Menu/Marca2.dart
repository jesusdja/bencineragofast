import 'package:flutter/material.dart';

class Marca2 {
  const Marca2({
    @required this.id,
    @required this.name,
  })  : assert(id != null),
        assert(name != null);
  final String id;
  final String name;
  Marca2 copyWith({
    String id,
    String name,
  }) {
    return Marca2(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
