import 'package:dartz/dartz.dart';
import 'package:menus_shibeen/domain/failure_rebo.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:menus_shibeen/models/product.dart';

abstract class HomeRebo {
  Future<Either<Failure, List<Place>>> fetchPlaces();
  Future<Either<Failure, List<Place>>> fetchRecommendedPlaces();
  Future<Either<Failure, List<Product>>> fetchTopRatedProducts();
}
