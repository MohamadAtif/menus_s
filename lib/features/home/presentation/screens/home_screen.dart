import 'package:flutter/material.dart';
import 'package:menus_shibeen/common/widgets/custom_button.dart';
import 'package:menus_shibeen/common/widgets/search_container.dart';
import 'package:menus_shibeen/features/admin/presentation/screens/addPlaceScreen.dart';

import 'package:menus_shibeen/features/home/presentation/screens/widgets/allproductslistview_bloc_builder.dart';
import 'package:menus_shibeen/features/home/presentation/screens/widgets/recommendedplaces_bloc_builder.dart';

import 'package:menus_shibeen/features/home/presentation/screens/widgets/top_categories.dart';
import 'package:menus_shibeen/utils/global_variables.dart';
import 'package:menus_shibeen/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const TopCategories(),
            const SizedBox(
              height: 10,
            ),

            const RecommendedPlacesListViewBlocBuilder(),

            const AllProductsListViewBlocBuilder(),

            // CollectionCategory()
            // BestSellerProduct(),
            // TopRated(),
            CustomButton(
                color: Colors.black,
                text: 'log out',
                onTap: () {
                  onBackDialog(context);
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.plus_one),
          onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddPlaceScreen()))
              }),
    );
  }
}
