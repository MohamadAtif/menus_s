import 'package:flutter/material.dart';
import 'package:menus_shibeen/common/widgets/image_product.dart';
import 'package:menus_shibeen/common/widgets/loader_gridview.dart';
import 'package:menus_shibeen/features/admin/data/service/admin_services.dart';
import 'package:menus_shibeen/features/admin/presentation/screens/addPlaceScreen.dart';

import 'package:menus_shibeen/models/place.dart';

class PlacePostsScreen extends StatefulWidget {
  const PlacePostsScreen({Key? key}) : super(key: key);

  @override
  State<PlacePostsScreen> createState() => _PlacePostsScreenState();
}

class _PlacePostsScreenState extends State<PlacePostsScreen> {
  List<Place>? places;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllPlaces();
  }

  fetchAllPlaces() async {
    places = await adminServices.fetchAllPlaces(context);
    setState(() {});
  }

  void deletePlace(Place place, int index) {
    adminServices.deletePlace(
      context: context,
      place: place,
      onSuccess: () {
        places!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddPlace() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddPlaceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return places == null
        ? const LoaderGridView()
        : Scaffold(
            body: GridView.builder(
              itemCount: places!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final placeData = places![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: ImageProduct(
                        image: placeData.images[0],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              placeData.name,
                              style: const TextStyle(fontFamily: 'Kanit'),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          IconButton(
                            onPressed: () => deletePlace(placeData, index),
                            icon: const Icon(
                              Icons.delete_outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: navigateToAddPlace,
              tooltip: 'Add a Place',
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
