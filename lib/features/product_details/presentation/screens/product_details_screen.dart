import 'package:flutter/material.dart';
import 'package:menus_shibeen/common/widgets/search_container.dart';
import 'package:menus_shibeen/models/product.dart';
import 'package:menus_shibeen/utils/global_variables.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // final ProductDetailsServices productDetailsServices =
  //     ProductDetailsServices();
  // double avgRating = 0;
  // double myRating = 0;
  // bool isLoading = false;
  // List<Product>? productList;
  // String? query;

  // final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    // calculateRating();
  }

  // fetchCategoryProducts() async {
  //   productList = await homeServices.fetchCategoryProducts(
  //     context: context,
  //     category: widget.product.category,
  //   );
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final productQuantity = widget.product.quantity;

    // ToastContext().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [SearchContainer()],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Number of Rating : ( ${widget.product.rating!.length} )",
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.teal.shade600,
                          fontSize: 12,
                        ),
                      ),
                      // Stars(
                      //   rating: avgRating,
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 10,
                  ),
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // ClipRRect(
                //     child: productQuantity == 0
                //         ? Banner(
                //             message: 'SOLD OUT',
                //             location: BannerLocation.topStart,
                //             child: ProductDetailsImageSlider(
                //               product: widget.product,
                //             ))
                //         : ProductDetailsImageSlider(
                //             product: widget.product,
                //           )),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: RichText(
                    text: TextSpan(
                      text: ' ',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit'),
                      children: [
                        TextSpan(
                          text: '${widget.product.price} EGP',
                          style: const TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.product.description,
                    style: const TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                // Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: CustomButton(
                //       color: GlobalVariables.myTealColor,
                //       text: 'Buy Now',
                //       onTap: buyNow,
                //     )),
                const SizedBox(height: 5),
                // Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: ButtonAddToCart(
                //       product: widget.product,
                //     )),
                const SizedBox(height: 10),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'Rate The Product',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Kanit'),
                  ),
                ),
                const SizedBox(height: 5),
                // RattingBar(product: widget.product),

                const SizedBox(height: 5),
                Divider(
                  thickness: 2,
                  color: Colors.grey.shade200,
                ),
                // const TextYouMaylike(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          // SliverToBoxAdapter(
          //     child: productList == null
          //         ? const SizedBox(child: Loader())
          //         : YouMAyAlsoLike(productList: productList))
        ],
      ),
    );
  }

  // void calculateRating() {
  //   double totalRating = 0;
  //   for (int i = 0; i < widget.product.rating!.length; i++) {
  //     totalRating += widget.product.rating![i].rating;

  //     if (widget.product.rating![i].userId ==
  //         Provider.of<UserProvider>(context, listen: false).user.id) {
  //       myRating = widget.product.rating![i].rating;
  //     }
  //   }

  //   if (totalRating != 0) {
  //     avgRating = totalRating / widget.product.rating!.length;
  //   }
  // }
}
