import 'package:flutter/material.dart';
import 'package:menus_shibeen/common/widgets/single_product.dart';
import 'package:menus_shibeen/features/product_details/presentation/screens/item_details_screen.dart';
import 'package:menus_shibeen/models/item.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class TopRatedProductsListView extends StatefulWidget {
  const TopRatedProductsListView({super.key, this.productList});
  final List<Item>? productList;
  @override
  State<TopRatedProductsListView> createState() =>
      _TopRatedProductsListViewState();
}

class _TopRatedProductsListViewState extends State<TopRatedProductsListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'RECENTLY ADDED',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade800,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.normal),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const AllProductsView()));
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 15, fontFamily: 'Kanit', color: Colors.teal),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
            height: 225,
            child: ScrollSnapList(
              itemBuilder: (context, index) {
                final productData = widget.productList![index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemDetailScreen(
                                      item: productData,
                                    )));
                      },
                      child: SingleProduct(
                        image: productData.images[0],
                        name: productData.name,
                        price: productData.price,
                      ),
                    )
                  ],
                );
              },
              itemCount: widget.productList!.length,
              itemSize: 163,
              onItemFocus: (index) {},
              dynamicItemSize: true,
            )
            //  ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: widget.productList!.length,
            //   itemExtent: 140,
            //   scrollDirection: Axis.horizontal,
            // itemBuilder: (context, index) {
            //   final productData = widget.productList![index];
            //   return Column(
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           // Navigator.push(
            //           //     context,
            //           //     MaterialPageRoute(
            //           //         builder: (context) => ProductDetailScreen(
            //           //               product: productData,
            //           //             )));
            //         },
            //         child: SizedBox(
            //           // height: 230,
            //           child: SingleProduct(
            //             image: productData.images[0],
            //             name: productData.name,
            //           ),
            //         ),
            //       ),
            //     ],
            //   );
            // },
            // ),
            ),
      ],
    );
  }
}
