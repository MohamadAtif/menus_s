import 'package:dartz/dartz.dart';
import 'package:menus_shibeen/domain/failure_rebo.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:menus_shibeen/models/product.dart';

abstract class ProductsRepo {
  // Future<Either<Failure, List<Product>>> fetchTopRatedProducts();
  Future<Either<Failure, List<Product>>> fetchAllProducts();
}
