import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:menus_shibeen/models/rating.dart';

part 'place.g.dart';

@HiveType(typeId: 0)
class Place {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String location;
  @HiveField(3)
  final List<String> images;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String? id;
  @HiveField(6)
  final List<Rating>? rating;

  Place({
    required this.location,
    required this.name,
    required this.description,
    required this.images,
    required this.category,
    this.id,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'location': location,
      'images': images,
      'category': category,
      'id': id,
      'rating': rating,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      location: map['location'] ?? '',
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      id: map['_id'],
      rating: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) => Place.fromMap(json.decode(source));
}
