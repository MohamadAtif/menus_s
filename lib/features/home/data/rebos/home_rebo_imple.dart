import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:menus_shibeen/core/failure_rebo.dart';
import 'package:menus_shibeen/core/rebos/home_rebo.dart';
import 'package:menus_shibeen/features/home/data/data-sources/home_local_data_source.dart';
import 'package:menus_shibeen/features/home/data/data-sources/home_remote_data_source.dart';
import 'package:menus_shibeen/models/place.dart';

class HomeReboImple extends HomeRebo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeReboImple(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<Place>>> fetchPlaces() async {
    List<Place> places;
    try {
      places = homeLocalDataSource.fetchPlaces();
      if (places.isNotEmpty) {
        return right(places);
      }
      places = await homeRemoteDataSource.fetchPlaces();
      return right(places);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.formDioException(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Place>>> fetchRecommendedPlaces() async {
    List<Place> places;
    try {
      places = homeLocalDataSource.fetchRecommendedPlaces();
      if (places.isNotEmpty) {
        return right(places);
      }
      places = await homeRemoteDataSource.fetchRecommendedPlaces();
      return right(places);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.formDioException(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }
}
