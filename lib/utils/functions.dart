import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:menus_shibeen/features/home/data/data-sources/home_local_data_source.dart';
import 'package:menus_shibeen/features/home/data/data-sources/home_remote_data_source.dart';
import 'package:menus_shibeen/features/home/data/rebos/home_rebo_imple.dart';

import 'package:menus_shibeen/models/place.dart';
import 'package:menus_shibeen/models/product.dart';
import 'package:menus_shibeen/services/api_service.dart';

//HiveBox
void savePlacesDataByHive(List<Place> places, String boxName) {
  var box = Hive.box<Place>(boxName);
  box.addAll(places);
}

void saveProductsDataByHive(List<Product> products, String boxName) {
  var box = Hive.box<Product>(boxName);
  box.addAll(products);
}

//Get It Function

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeReboImple>(
    HomeReboImple(
      homeLocalDataSource: HomeLocalDataSourceImple(),
      homeRemoteDataSource: HomeRemoteDataSourceImple(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
}
