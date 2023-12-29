import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menus_shibeen/features/home/presentation/manager/all_places_cubit/all_places_cubit.dart';
import 'package:menus_shibeen/features/home/presentation/screens/widgets/recently_added_list.dart';

class AllPlacesListViewBlocBuilder extends StatelessWidget {
  const AllPlacesListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllPlacesCubit, AllPlacesState>(
      builder: (context, state) {
        if (state is AllPlacesSuccess) {
          return const AllProductsListView();
        } else if (state is AllPlacesFailure) {
          return Text(state.errMessage);
        } else if (state is AllPlacesLoading) {
          return const CircularProgressIndicator();
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
