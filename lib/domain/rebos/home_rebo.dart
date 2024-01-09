import 'package:dartz/dartz.dart';
import 'package:menus_shibeen/domain/failure_rebo.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:menus_shibeen/models/item.dart';

abstract class HomeRebo {
  Future<Either<Failure, List<Place>>> fetchPlaces();
  Future<Either<Failure, List<Place>>> fetchRecommendedPlaces();
  Future<Either<Failure, List<Item>>> fetchTopRatedProducts();
  // Future<Either<Failure, List<Product>>> fetchAllProducts();
}
