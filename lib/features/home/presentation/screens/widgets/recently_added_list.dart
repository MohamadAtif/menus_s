import 'package:flutter/material.dart';
import 'package:menus_shibeen/common/widgets/single_product.dart';
import 'package:menus_shibeen/models/product.dart';

class TopRatedProductsListView extends StatefulWidget {
  const TopRatedProductsListView({super.key});

  @override
  State<TopRatedProductsListView> createState() =>
      _TopRatedProductsListViewState();
}

class _TopRatedProductsListViewState extends State<TopRatedProductsListView> {
  List<Product>? productList;

  // final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
  }

  // fetchCategoryProducts() async {
  //   productList = await homeServices.fetchAllProductsRecentlyAdded(
  //     context: context,
  //   );
  //   setState(() {});
  // }

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
          height: 178,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: productList!.length,
            itemExtent: 140,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final productData = productList![index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ProductDetailScreen(
                      //               product: productData,
                      //             )));
                    },
                    child: SizedBox(
                      // height: 230,
                      child: SingleProduct(
                        image: productData.images[0],
                        name: productData.name,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
