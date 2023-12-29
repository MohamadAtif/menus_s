import 'package:dartz/dartz.dart';
import 'package:menus_shibeen/core/failure_rebo.dart';
import 'package:menus_shibeen/models/place.dart';

abstract class HomeRebo {
  Future<Either<Failure, List<Place>>> fetchPlaces();
  Future<Either<Failure, List<Place>>> fetchRecommendedPlaces();
}
