import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menus_shibeen/common/widgets/single_product.dart';

import 'package:menus_shibeen/features/home/presentation/screens/widgets/product_details_image_slider.dart';
import 'package:menus_shibeen/features/placeDeatais/widgets/container_menu.dart';
import 'package:menus_shibeen/features/placeDeatais/widgets/drinks_page.dart';
import 'package:menus_shibeen/models/place.dart';

class PlaceDetailScreen extends StatefulWidget {
  final Place place;
  const PlaceDetailScreen({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  // final ProductDetailsServices productDetailsServices =
  //     ProductDetailsServices();
  // double avgRating = 0;
  // double myRating = 0;
  List<Place>? placeList;

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
    // ToastContext().init(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: null,
              backgroundColor: Colors.teal[400],
              pinned: true,
              expandedHeight: 250,
              title: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black38,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Text(
                    widget.place.name,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                  background: PlaceDetailsImageSlider(
                place: widget.place,
              )
                  //  CachedNetworkImage(
                  //   imageUrl: widget.place.images[0],
                  //   fit: BoxFit.fill,
                  // ),
                  ),
            ),
            // const SliverToBoxAdapter(
            //   child: SizedBox(
            //       height: 85,
            //       child: Padding(
            //         padding: EdgeInsets.all(8.0),
            //         child: Column(
            //           children: [
            //             SearchContainer(),
            //           ],
            //         ),
            //       )),
            // ),
            SliverFillRemaining(
              child: Column(
                children: [
                  const TabBar(tabs: [
                    Tab(
                      child: Text(
                        'DRINKS',
                        style: TextStyle(fontFamily: 'Kanit'),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'FOODS',
                        style: TextStyle(fontFamily: 'Kanit'),
                      ),
                    ),
                    Tab(
                        child: Text(
                      'DESSERTS',
                      style: TextStyle(fontFamily: 'Kanit'),
                    )),
                  ]),
                  Expanded(
                    child: TabBarView(children: [
                      DrinksPage(place: widget.place),
                      Container(
                        child: const Center(child: Text('Foods')),
                      ),
                      Container(
                        child: const Center(child: Text('desserts')),
                      ),
                    ]),
                  )
                ],
              ),
            )
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (context, index) {
            //       return const ProductCardOfHomePage();
            //     },
            //     childCount: 20,
            //   ),
            // )
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
            // autoPlayCurve: Curves.fastOutSlowIn,
            //               enlargeCenterPage: true,
            //               pageSnapping: true,

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
