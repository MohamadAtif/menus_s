import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:menus_shibeen/models/place.dart';

class PlaceDetailsImageSlider extends StatelessWidget {
  const PlaceDetailsImageSlider({super.key, required this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: place.images.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => CachedNetworkImage(
              imageUrl: i,
              fit: BoxFit.fill,
              height: 200,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 280,
      ),
    );
  }
}
