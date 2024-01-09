import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContainerPlaceMenu extends StatelessWidget {
  final String image;

  final String? name;
  final double? price;
  const ContainerPlaceMenu({
    Key? key,
    required this.image,
    this.name,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // height: 220,

        Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
            child: CachedNetworkImage(
              height: 40,
              width: 40,
              imageUrl: image,
              // s
            ),
          ),
          const Text(
            ' name',
            style: TextStyle(fontFamily: 'Kanit', fontSize: 16),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          // Text(
          //   "${price.toString()} EGP",
          //   style: const TextStyle(
          //       color: Colors.red, fontFamily: 'Kanit', fontSize: 14),
          //   overflow: TextOverflow.ellipsis,
          //   maxLines: 1,
          // ),
        ],
      ),
    );
  }
}
