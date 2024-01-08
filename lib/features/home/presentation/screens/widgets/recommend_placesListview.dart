import 'package:flutter/material.dart';
import 'package:menus_shibeen/common/widgets/single_product.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class RecommendedPlacesListView extends StatefulWidget {
  const RecommendedPlacesListView({super.key, this.placesList});
  final List<Place>? placesList;
  @override
  State<RecommendedPlacesListView> createState() =>
      _RecommendedPlacesListViewState();
}

class _RecommendedPlacesListViewState extends State<RecommendedPlacesListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Recomended Places',
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
                final placeData = widget.placesList![index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ProductDetailScreen(
                        //               product: placeData!,
                        //             )));
                      },
                      child: SingleProduct(
                        image:
                            'https://images.puma.com/image/upload/q_auto,f_auto,w_1440/regional/%7Eregional%7EDFA%7Eothers%7EKOPs%7EAW23%7EBASKETBALL%7EMB03+TOXIC%7E23AW_Ecom_BB_MB03_Toxic_Full-Bleed-Hero_Large_Desk_1440x500px_2.jpg/fmt/jpg/fmt/png',
                        // image: 'placeData.images[0],',
                        name: placeData.name,
                        // price: placeData.category!
                      ),
                    )
                  ],
                );
              },
              itemCount: widget.placesList!.length,
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
