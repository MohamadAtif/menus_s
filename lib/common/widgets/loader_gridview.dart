import 'package:flutter/material.dart';
import 'package:menus_shibeen/common/widgets/item_shimmer_Loader.dart';
import 'package:shimmer/shimmer.dart';

class LoaderGridView extends StatelessWidget {
  const LoaderGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 160,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 3),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.white,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ItemLoader(),
              )),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            //mainAxisExtent: 2
            // crossAxisSpacing: 10,
            // childAspectRatio: 1 / 1.7,
          ),
        ),
      ),
    );
  }
}
