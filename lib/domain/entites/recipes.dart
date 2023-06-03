import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Recipes extends Equatable {
  final String id;
  final String name;
  final String image;
  final String time;
  final String description;
  final List<String> ingredients;

  const Recipes({
    required this.id,
    required this.name,
    required this.image,
    required this.time,
    required this.description,
    required this.ingredients,}
  );

  @override
  List<Object> get props => [
        id,
        name,
        image,
        time,
        description,
        ingredients,
      ];
}
