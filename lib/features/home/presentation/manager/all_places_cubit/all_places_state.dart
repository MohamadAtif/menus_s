part of 'all_places_cubit.dart';

@immutable
sealed class AllPlacesState {}

final class AllPlacesInitial extends AllPlacesState {}

final class AllPlacesLoading extends AllPlacesState {}

final class AllPlacesFailure extends AllPlacesState {
  final String errMessage;

  AllPlacesFailure({required this.errMessage});
}

final class AllPlacesSuccess extends AllPlacesState {
  final List<Place> places;
  AllPlacesSuccess({required this.places});
}
