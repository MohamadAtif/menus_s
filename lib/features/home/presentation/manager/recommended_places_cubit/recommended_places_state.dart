part of 'recommended_places_cubit.dart';

@immutable
sealed class RecommendedPlacesState {}

final class RecommendedPlacesInitial extends RecommendedPlacesState {}

final class RecommendedPlacesLoading extends RecommendedPlacesState {}

final class RecommendedPlacesFailure extends RecommendedPlacesState {
  final String errMessage;

  RecommendedPlacesFailure({required this.errMessage});
}

final class RecommendedPlacesSuccess extends RecommendedPlacesState {
  final List<Place> places;
  RecommendedPlacesSuccess({required this.places});
}
