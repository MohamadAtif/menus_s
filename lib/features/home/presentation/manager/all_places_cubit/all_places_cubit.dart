import 'package:bloc/bloc.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:meta/meta.dart';

part 'all_places_state.dart';

class AllPlacesCubit extends Cubit<AllPlacesState> {
  AllPlacesCubit() : super(AllPlacesInitial());
}
