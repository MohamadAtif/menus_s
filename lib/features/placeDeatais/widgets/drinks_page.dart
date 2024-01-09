import 'package:flutter/material.dart';
import 'package:menus_shibeen/features/home/presentation/screens/widgets/place_details_view.dart';
import 'package:menus_shibeen/features/placeDeatais/widgets/container_menu.dart';
import 'package:menus_shibeen/models/place.dart';

class DrinksPage extends StatelessWidget {
  const DrinksPage({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 40),
                //     const SliverGridDelegateWithMaxCrossAxisExtent(
                //   mainAxisExtent: 120, maxCrossAxisExtent: 60,
                //   // mainAxisSpacing: 5,
                //   // crossAxisSpacing: 2,
                //   //   childAspectRatio: 160.06 / 190.42
                // ),
                itemCount: 30,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  // var item = GroceryServices.products[index];
                  // double discount = (item['price'] * 10) / 100;
                  // double totalDiscount = item['price'] - discount;
                  return InkWell(
                      onTap: () {},
                      child: ContainerPlaceMenu(
                        image: place.images[0],
                      )
                      //  Container(
                      //   width: 150,
                      //   decoration: BoxDecoration(
                      //       color: Colors.grey,
                      //       borderRadius:
                      //           BorderRadius.circular(6),
                      //       border:
                      //           Border.all(color: Colors.black)),
                      //   child: (const Text('Drinks')),
                      // )
                      );
                }),
          ),
        )
      ],
    );
  }
}
