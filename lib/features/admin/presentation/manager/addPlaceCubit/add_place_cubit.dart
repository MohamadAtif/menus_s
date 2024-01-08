import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menus_shibeen/domain/rebos/admin_rebo.dart';
import 'package:menus_shibeen/domain/rebos/home_rebo.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:meta/meta.dart';

part 'add_place_state.dart';

class AddPlaceCubit extends Cubit<AddPlaceState> {
  AddPlaceCubit(
    this.adminRepo,
  ) : super(AddPlaceInitial());
  final AdminRepo adminRepo;

  Future<void> addPlaces(Place place) async {
    emit(AddPlaceLoading());
    var result = await adminRepo.addPlace(place);
    result.fold((failure) {
      emit(AddPlaceFailure(errMessage: failure.errmessage));
    }, (places) {
      emit(AddPlaceSuccess(places: places));
    });
  }
}
