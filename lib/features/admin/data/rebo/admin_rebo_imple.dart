import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:menus_shibeen/domain/failure_rebo.dart';
import 'package:menus_shibeen/domain/rebos/admin_rebo.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:menus_shibeen/services/api_service.dart';

class AdminRepoImple implements AdminRepo {
  final ApiService apiService;
  // final HomeLocalDataSource homeLocalDataSource;
  // final HomeRemoteDataSource homeRemoteDataSource;

  AdminRepoImple({required this.apiService});
  @override
  Future<Either<Failure, dynamic>> addPlace(Place placeModel) async {
    try {
      print('START REBO');
      var data = await apiService.addPlace(
          endPoint: '/admin/add-place',
          name: placeModel.name,
          description: placeModel.description,
          location: placeModel.location);

      print('end REBO');
      print(data);

      List<Place> places = [];
      for (var item in data['places']) {
        places.add(Place.fromMap(item));

        return right(places);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.formDioException(e));
      }
      return left(ServerFaliure(e.toString()));
    }
    return left(ServerFaliure('error 500'));
  }

  @override
  Future<Either<Failure, dynamic>> deletePlace(String id) async {
    try {
      var data = await apiService.deletePlace(
        endPoint: '/admin/delete-place',
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.formDioException(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, List<Place>>> getPlaces() {

  //      List<Place> places;
  //   try {
  //     places = homeLocalDataSource.fetchPlaces();
  //     if (places.isNotEmpty) {
  //       return right(places);
  //     }
  //     places = await homeRemoteDataSource.fetchPlaces();
  //     return right(places);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFaliure.formDioException(e));
  //     }
  //     return left(ServerFaliure(e.toString()));
  //   }
  // }
}
//  @override
//   Future<Either<Failure, dynamic>> postFruits(FruitModel fruitModel) async {
    // try {
    //   print('START REBO');
    //   var data = await apiService.postFruits(
    //     endPoint: 'fruits',
    //     countinStock: 'fruitModel.countinStock',
    //     description: 'fruitModel.description',
    //     // image: 'fruitModel.image',
    //     price: 'fruitModel.price',
    //     title: 'fruitModel.title',
    //   );
    //   print('end REBO');
    //   print(data);

    //   List<FruitModel> fruits = [];
    //   for (var item in data['fruits']) {
    //     fruits.add(FruitModel.fromJson(item));
    //     print(fruits);
    //     return right(fruits);
    //   }
    // } catch (e) {
    //   if (e is DioException) {
    //     return left(ServerFaliure.formDioException(e));
    //   }
    //   return left(ServerFaliure(e.toString()));
    // }
    // return left(ServerFaliure('error 500'));
//   }

//   @override
//   Future<Either<Failure, dynamic>> deleteFruits(String id) async {
//     try {
//       var data = await apiService.deleteFruits(
//         endPoint: 'fruits/$id',
//       );
//       return right(unit);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFaliure.formDioException(e));
//       }
//       return left(ServerFaliure(e.toString()));
//     }
//   }