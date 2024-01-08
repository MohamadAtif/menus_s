import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menus_shibeen/common/widgets/custom_button.dart';
import 'package:menus_shibeen/domain/rebos/home_rebo.dart';
import 'package:menus_shibeen/features/admin/data/rebo/admin_rebo_imple.dart';
import 'package:menus_shibeen/features/admin/data/service/admin_services.dart';
import 'package:menus_shibeen/features/admin/presentation/manager/addPlaceCubit/add_place_cubit.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:menus_shibeen/services/api_service.dart';
import 'package:menus_shibeen/utils/global_variables.dart';
import 'package:menus_shibeen/utils/utils.dart';

import '../../../../common/widgets/custom_textfield.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController placeNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  // final TextEditingController quantityController = TextEditingController();
  // final AdminServices adminServices = AdminServices();
  bool isLoading = false;
  String category = 'Cafes';
  Place? place;
  List<File> images = [];
  final _addPlaceFormKey = GlobalKey<FormState>();
  final AdminServices adminServices = AdminServices();

  @override
  void dispose() {
    super.dispose();
    placeNameController.dispose();
    descriptionController.dispose();
    locationController.dispose();
  }

  List<String> placeCategories = [
    'Cafes',
    'Resturaunts',
    'Fast Food',
    'Others'
  ];

  // void addPlace() async {
  //   if (_addPlaceFormKey.currentState!.validate() && images.isNotEmpty) {
  //     try {
  //       var placeModel = Place(
  //           name: placeNameController.text,
  //           description: descriptionController.text,
  //           location: locationController.text,
  //           images: images[0],
  //           category: category);

  //       print(placeModel);

  //       await BlocProvider.of<AddPlaceCubit>(context).addPlaces(placeModel);
  //       print('==================uy=================');
  //     } catch (e) {
  //       print(e.toString());
  //     }
  //   }
  // }

  void addplace() {
    if (_addPlaceFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.addPlace(
          context: context,
          name: placeNameController.text,
          description: descriptionController.text,
          location: locationController.text,
          category: category,
          images: images);
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Add Place',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => AddPlaceCubit(
          AdminRepoImple(
            apiService: ApiService(Dio()),
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _addPlaceFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  CustomButton(
                      color: Colors.black,
                      text: 'log out',
                      onTap: () {
                        onBackDialog(context);
                      }),

                  const SizedBox(height: 8),
                  images.isNotEmpty
                      ? CarouselSlider(
                          items: images.map(
                            (i) {
                              return Builder(
                                builder: (BuildContext context) => Image.file(
                                  i,
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              );
                            },
                          ).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: 200,
                          ),
                        )
                      : GestureDetector(
                          onTap: selectImages,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [10, 4],
                            strokeCap: StrokeCap.round,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.folder_open,
                                    size: 40,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'Select Place Images',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Kanit',
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: placeNameController,
                    hintText: 'Place Name',
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: descriptionController,
                    hintText: 'Description',
                    maxLines: 7,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: locationController,
                    hintText: 'Location',
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: category,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: placeCategories.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(fontFamily: 'Kanit'),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          category = newVal!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async {
                      addplace();
                      setState(() {
                        isLoading = true;
                      });

                      await Future.delayed(const Duration(seconds: 1));

                      setState(() {
                        isLoading = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: GlobalVariables.myTealColor,
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Add',
                            style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  // CustomButton(
                  //   text: 'Sell',
                  //   onTap: () async {
                  //     setState(() {
                  //       isLoading = true;
                  //     });
                  //     addPlace();
                  //     await Future.delayed(const Duration(seconds: 2));

                  //     setState(() {
                  //       isLoading = false;
                  //     });
                  //   },
                  //   color: Colors.deepPurple,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
