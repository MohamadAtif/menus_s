import 'package:hive/hive.dart';
import 'package:menus_shibeen/common/widgets/consts.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:menus_shibeen/services/api_service.dart';
import 'package:menus_shibeen/utils/functions.dart';

abstract class HomeRemoteDataSource {
  Future<List<Place>> fetchPlaces();
  Future<List<Place>> fetchRecommendedPlaces();
}

class HomeRemoteDataSourceImple extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImple({required this.apiService});
  @override
  Future<List<Place>> fetchPlaces() async {
    var data = await apiService.get(endPoint: '/api/get-all-places');
    List<Place> places = getBooksList(data);

    //cash places data in local box by hive
    savePlacesDataByHive(places, kAllPlacesBox);

    return places;
  }

  @override
  Future<List<Place>> fetchRecommendedPlaces() async {
    var data = await apiService.get(endPoint: '/api/top-rated-places');

    List<Place> places = getBooksList(data);

    savePlacesDataByHive(places, kRecommendedPlacesBox);
    return places;
  }

////////////////
  ///
  List<Place> getBooksList(Map<String, dynamic> data) {
    List<Place> places = [];
    for (var item in data['Place']) {
      places.add(Place.fromJson(item));
    }
    return places;
  }
}
