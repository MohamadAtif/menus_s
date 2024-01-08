part of 'add_place_cubit.dart';

@immutable
sealed class AddPlaceState {}

final class AddPlaceInitial extends AddPlaceState {}

final class AddPlaceLoading extends AddPlaceState {}

final class AddPlaceFailure extends AddPlaceState {
  final String errMessage;

  AddPlaceFailure({required this.errMessage});
}

final class AddPlaceSuccess extends AddPlaceState {
  final List<Place> places;
  AddPlaceSuccess({required this.places});
}
