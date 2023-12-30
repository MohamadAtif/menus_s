import 'package:flutter/material.dart';
import 'package:menus_shibeen/common/widgets/search_container.dart';
import 'package:menus_shibeen/features/home/presentation/screens/widgets/allplacesListView_bloc_builder.dart';
import 'package:menus_shibeen/features/home/presentation/screens/widgets/allproductslistview_bloc_builder.dart';
import 'package:menus_shibeen/features/home/presentation/screens/widgets/productCardHome.dart';
import 'package:menus_shibeen/features/home/presentation/screens/widgets/top_categories.dart';
import 'package:menus_shibeen/utils/global_variables.dart';

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
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            TopCategories(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Recommended',
                  style: TextStyle(fontFamily: 'Kanit', fontSize: 20),
                ),
              ),
            ),

            ProductCardOfHomePage(),
            AllProductsListViewBlocBuilder()

            // CollectionCategory()
            // BestSellerProduct(),
            // TopRated(),
          ],
        ),
      ),
    );
  }
}
