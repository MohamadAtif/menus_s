import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menus_shibeen/features/home/presentation/manager/recommended_places_cubit/recommended_places_cubit.dart';
import 'package:menus_shibeen/features/home/presentation/screens/widgets/recommend_placesListview.dart';

class RecommendedPlacesListViewBlocBuilder extends StatelessWidget {
  const RecommendedPlacesListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedPlacesCubit, RecommendedPlacesState>(
      builder: (context, state) {
        if (state is RecommendedPlacesSuccess) {
          return RecommendedPlacesListView(
            placesList: state.places,
          );
        } else if (state is RecommendedPlacesFailure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
