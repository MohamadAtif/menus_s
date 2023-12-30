import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menus_shibeen/features/home/presentation/manager/all_places_cubit/all_places_cubit.dart';
import 'package:menus_shibeen/features/home/presentation/manager/all_products_cubit/toprated_products_cubit.dart';
import 'package:menus_shibeen/features/home/presentation/screens/widgets/recently_added_list.dart';

class AllProductsListViewBlocBuilder extends StatelessWidget {
  const AllProductsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedProductsCubit, TopRatedProductsState>(
      builder: (context, state) {
        if (state is TopRatedProductsSuccess) {
          return const TopRatedProductsListView();
        } else if (state is TopRatedProductsFailure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
