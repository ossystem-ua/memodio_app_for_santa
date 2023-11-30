// A widget that represents a single child item in the list.
import 'package:flutter/material.dart';

@immutable
class Child {
  final String id;
  final String name;
  final String country;
  final bool status;

  Child({
    required this.name,
    required this.country,
    this.status = true,
  }) : id = DateTime.now().microsecondsSinceEpoch.toString();

  Child copyWith({String? name, String? country, bool? status}) => Child(
        name: name ?? this.name,
        country: country ?? this.country,
        status: status ?? this.status,
      );
}
