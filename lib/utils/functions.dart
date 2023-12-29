import 'package:hive/hive.dart';
import 'package:menus_shibeen/models/place.dart';

void savePlacesDataByHive(List<Place> places, String boxName) {
  var box = Hive.box(boxName);
  box.addAll(places);
}
