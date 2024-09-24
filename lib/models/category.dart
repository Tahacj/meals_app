import 'package:flutter/material.dart';

class Category {
  final int Id;
  final String title;
  final Color color;

  const Category({
    required this.Id,
    required this.title,
    this.color = Colors.purple,
  });
}
