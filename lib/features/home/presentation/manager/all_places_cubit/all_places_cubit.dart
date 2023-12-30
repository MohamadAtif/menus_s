import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menus_shibeen/domain/rebos/home_rebo.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:meta/meta.dart';

part 'all_places_state.dart';

class AllPlacesCubit extends Cubit<AllPlacesState> {
  AllPlacesCubit(this.homeRebo) : super(AllPlacesInitial());
  final HomeRebo homeRebo;

  Future<void> fetchAllPlaces() async {
    emit(AllPlacesLoading());
    var result = await homeRebo.fetchPlaces();
    result.fold((failure) {
      emit(AllPlacesFailure(errMessage: failure.errmessage));
    }, (places) {
      emit(AllPlacesSuccess(places: places));
    });
  }
}
