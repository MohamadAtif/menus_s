import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menus_shibeen/common/widgets/search_container.dart';
import 'package:menus_shibeen/features/home/presentation/screens/widgets/productCardHome.dart';
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
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(60),
      //   child: AppBar(
      //     flexibleSpace: Container(
      //       decoration: const BoxDecoration(
      //         gradient: GlobalVariables.appBarGradient,
      //       ),
      //     ),
      //     // title: const Row(
      //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //   children: [SearchContainer()],
      //     // ),
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: null,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            pinned: true,
            expandedHeight: 300,
            title: Text(
              'Soul Cafe',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade200,
              ),
            ),
            centerTitle: false,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl:
                    'https://images.puma.com/image/upload/q_auto,f_auto,w_1440/regional/%7Eregional%7EDFA%7Eothers%7EKOPs%7EAW23%7EBASKETBALL%7EMB03+TOXIC%7E23AW_Ecom_BB_MB03_Toxic_Full-Bleed-Hero_Large_Desk_1440x500px_2.jpg/fmt/jpg/fmt/png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
                height: 85,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SearchContainer(),
                    ],
                  ),
                )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const ProductCardOfHomePage();
              },
              childCount: 20,
            ),
          )
          // SliverToBoxAdapter(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Padding(
          //         padding: EdgeInsets.all(9.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             // Text(
          //             //   "Number of Rating : ( ${widget.product.rating!.length} )",
          //             //   style: TextStyle(
          //             //     fontFamily: 'Kanit',
          //             //     color: Colors.teal.shade600,
          //             //     fontSize: 12,
          //             //   ),
          //             // ),
          //             // Stars(
          //             //   rating: avgRating,
          //             // ),
          //           ],
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(
          //           vertical: 7,
          //           horizontal: 10,
          //         ),
          //         child: Text(
          //           widget.product.name,
          //           style: const TextStyle(
          //               fontSize: 18,
          //               fontFamily: 'Kanit',
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //       // ClipRRect(
          //       //     child: productQuantity == 0
          //       //         ? Banner(
          //       //             message: 'SOLD OUT',
          //       //             location: BannerLocation.topStart,
          //       //             child: ProductDetailsImageSlider(
          //       //               product: widget.product,
          //       //             ))
          //       //         : ProductDetailsImageSlider(
          //       //             product: widget.product,
          //       //           )),
          //       Divider(
          //         thickness: 1,
          //         color: Colors.grey.shade300,
          //       ),

          //       Padding(
          //         padding: const EdgeInsets.all(8),
          //         child: RichText(
          //           text: TextSpan(
          //             text: ' ',
          //             style: const TextStyle(
          //                 fontSize: 16,
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.bold,
          //                 fontFamily: 'Kanit'),
          //             children: [
          //               TextSpan(
          //                 text: '${widget.product.price} EGP',
          //                 style: const TextStyle(
          //                   fontFamily: 'Kanit',
          //                   fontSize: 22,
          //                   color: Colors.red,
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(10.0),
          //         child: Text(
          //           widget.product.description,
          //           style: const TextStyle(
          //             fontFamily: 'Kanit',
          //             fontSize: 17,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //       ),
          //       Divider(
          //         thickness: 1,
          //         color: Colors.grey.shade300,
          //       ),
          //       // Padding(
          //       //     padding: const EdgeInsets.all(10),
          //       //     child: CustomButton(
          //       //       color: GlobalVariables.myTealColor,
          //       //       text: 'Buy Now',
          //       //       onTap: buyNow,
          //       //     )),
          //       const SizedBox(height: 5),
          //       // Padding(
          //       //     padding: const EdgeInsets.all(10),
          //       //     child: ButtonAddToCart(
          //       //       product: widget.product,
          //       //     )),
          //       const SizedBox(height: 10),

          //       const Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 12.0),
          //         child: Text(
          //           'Rate The Product',
          //           style: TextStyle(
          //               fontSize: 18,
          //               fontWeight: FontWeight.normal,
          //               fontFamily: 'Kanit'),
          //         ),
          //       ),
          //       const SizedBox(height: 5),
          //       // RattingBar(product: widget.product),

          //       const SizedBox(height: 5),
          //       Divider(
          //         thickness: 2,
          //         color: Colors.grey.shade200,
          //       ),
          //       // const TextYouMaylike(),
          //       const SizedBox(
          //         height: 20,
          //       ),
          //     ],
          //   ),
          // ),
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
