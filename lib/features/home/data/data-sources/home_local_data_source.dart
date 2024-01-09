import 'package:hive_flutter/hive_flutter.dart';
import 'package:menus_shibeen/common/widgets/consts.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:menus_shibeen/models/item.dart';

abstract class HomeLocalDataSource {
  List<Place> fetchPlaces();
  List<Place> fetchRecommendedPlaces();
  List<Item> fetchTopRatedProducts();
}

class HomeLocalDataSourceImple extends HomeLocalDataSource {
  @override
  List<Place> fetchPlaces() {
    var box = Hive.box<Place>(kAllPlacesBox);
    return box.values.toList();
  }

  @override
  List<Place> fetchRecommendedPlaces() {
    var box = Hive.box<Place>(kRecommendedPlacesBox);
    return box.values.toList();
  }

  @override
  List<Item> fetchTopRatedProducts() {
    var box = Hive.box<Item>(kTopRatedProductsBox);
    return box.values.toList();
  }
}
