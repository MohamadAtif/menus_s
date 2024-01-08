import 'package:menus_shibeen/common/widgets/consts.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:menus_shibeen/models/product.dart';
import 'package:menus_shibeen/services/api_service.dart';
import 'package:menus_shibeen/utils/functions.dart';

abstract class HomeRemoteDataSource {
  Future<List<Place>> fetchPlaces();
  Future<List<Place>> fetchRecommendedPlaces();
  Future<List<Product>> fetchTopRatedProducts();
}

class HomeRemoteDataSourceImple extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImple({required this.apiService});
  @override
  Future<List<Place>> fetchPlaces() async {
    var data = await apiService.get(endPoint: '/api/get-all-places');
    List<Place> places = getPlacesList(data);

    //cash places data in local box by hive
    savePlacesDataByHive(places, kAllPlacesBox);

    return places;
  }

  @override
  Future<List<Place>> fetchRecommendedPlaces() async {
    var data = await apiService.get(endPoint: '/api/get-all-places');

    List<Place> places = getPlacesList(data);

    savePlacesDataByHive(places, kRecommendedPlacesBox);
    return places;
  }

  @override
  Future<List<Product>> fetchTopRatedProducts() async {
    var data = await apiService.get(endPoint: '/api/get-all-products');

    List<Product> products = getProductsList(data);
    saveProductsDataByHive(products, kTopRatedProductsBox);

    return products;
  }

////////////////
  ///
  ///
  ///
  ///
  List<Place> getPlacesList(Map<String, dynamic> data) {
    List<Place> places = [];
    for (var item in data['places']) {
      places.add(Place.fromMap(item));
    }
    return places;
  }

  List<Product> getProductsList(Map<String, dynamic> data) {
    List<Product> products = [];

    for (var item in data['products']) {
      products.add(Product.fromMap(item));
    }
    return products;
  }
}
