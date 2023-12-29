import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class TopRated extends StatefulWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  // Product? product;
  // final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    topRated();
  }

  void topRated() async {
    // product = await homeServices.topRated(context: context);
    setState(() {});
  }

  // void navigateToDetailScreen() {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => ProductDetailScreen(product: product!)));
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: Text(
              'TOP RATED',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade800,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          // CachedNetworkImage(
          //   imageUrl: product!.images[0],
          //   height: 235,
          //   fit: BoxFit.fitHeight,
          // ),

          // Container(
          //   alignment: Alignment.topLeft,
          //   padding:
          //       const EdgeInsets.only(left: 15, top: 5, right: 40),
          //   child: const Text(
          //     'dealName',
          //     style: TextStyle(
          //       fontFamily: 'Kanit',
          //       fontSize: 22,
          //       fontWeight: FontWeight.w500,
          //     ),
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //   ),
          // ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: product!.images
          //         .map(
          //           (e) => Image.network(
          //             e,
          //             fit: BoxFit.fitWidth,
          //             width: 100,
          //             height: 100,
          //           ),
          //         )
          //         .toList(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
