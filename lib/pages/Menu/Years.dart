import 'package:flutter/material.dart';

class Year {
  const Year({
    @required this.id,
    @required this.name,
  })  : assert(id != null),
        assert(name != null);
  final String id;
  final String name;
  Year copyWith({
    String id,
    String name,
  }) {
    return Year(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
