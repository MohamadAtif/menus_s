import 'package:dartz/dartz.dart';
import 'package:menus_shibeen/domain/failure_rebo.dart';
import 'package:menus_shibeen/models/place.dart';

abstract class AdminRepo {
  // Future<Either<Failure, List<Place>>> getPlaces();
  Future<Either<Failure, dynamic>> addPlace(Place placeModel);
  Future<Either<Failure, dynamic>> deletePlace(String id);
}
