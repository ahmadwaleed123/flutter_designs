import 'package:flutter/material.dart';

class Specialist {
  final int id;
  final String name;
  final String specialty;
  final String initials;
  final double rating;
  final double price;
  final String bio;
  final Color avatarColor;

  const Specialist({
    required this.id,
    required this.name,
    required this.specialty,
    required this.initials,
    required this.rating,
    required this.price,
    required this.bio,
    required this.avatarColor,
  });
}
