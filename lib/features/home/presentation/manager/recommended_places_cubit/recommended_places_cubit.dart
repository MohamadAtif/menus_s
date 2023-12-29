import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menus_shibeen/core/rebos/home_rebo.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:meta/meta.dart';

part 'recommended_places_state.dart';

class RecommendedPlacesCubit extends Cubit<RecommendedPlacesState> {
  RecommendedPlacesCubit(this.homeRebo) : super(RecommendedPlacesInitial());

  final HomeRebo homeRebo;

  Future<void> fetchRecommendedPlaces() async {
    emit(RecommendedPlacesLoading());
    var result = await homeRebo.fetchRecommendedPlaces();
    result.fold((failure) {
      emit(RecommendedPlacesFailure(errMessage: failure.errmessage));
    }, (places) {
      emit(RecommendedPlacesSuccess(places: places));
    });
  }
}
