import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardOfHomePage extends StatelessWidget {
  const ProductCardOfHomePage({super.key, this.image, this.name, this.price});
  final String? image;

  final String? name;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 2,
            childAspectRatio: 160.06 / 190.42),
        itemCount: 4,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          // var item = GroceryServices.products[index];
          // double discount = (item['price'] * 10) / 100;
          // double totalDiscount = item['price'] - discount;
          return InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => DetailProductView(
              //             item: item,
              //           )),
              // );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Color(0xffFFFDFD),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 97.0,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.0))),
                    child: CachedNetworkImage(
                        height: 130,
                        width: 120,
                        imageUrl:
                            'https://images.puma.com/image/upload/q_auto,f_auto,w_1440/regional/%7Eregional%7EDFA%7Eothers%7EKOPs%7EAW23%7EBASKETBALL%7EMB03+TOXIC%7E23AW_Ecom_BB_MB03_Toxic_Full-Bleed-Hero_Large_Desk_1440x500px_2.jpg/fmt/jpg/fmt/png'
                        // image,
                        // s
                        ),
                  ),
                  const SizedBox(
                    height: 11.35,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 11.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('name.toString()',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            )),
                        const SizedBox(
                          height: 8.65,
                        ),
                        Row(
                          children: [
                            Text("category",
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff8B9E9E),
                                )),
                            const Spacer(),
                            const Icon(
                              Icons.star,
                              size: 14.0,
                              color: Colors.orange,
                            ),
                            Text("4.5",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                )),
                            const SizedBox(
                              width: 22.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 13.2,
                        ),
                        Row(
                          children: [
                            Text('13.0',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff02A88A),
                                )),
                            const SizedBox(
                              width: 6.66,
                            ),
                            Text("Discount",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.lineThrough,
                                  color: const Color(0xffF25822),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
