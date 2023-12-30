import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:menus_shibeen/auth/screens/auth_screen.dart';
import 'package:menus_shibeen/auth/services/auth_service.dart';
import 'package:menus_shibeen/common/widgets/bottom_bar.dart';
import 'package:menus_shibeen/common/widgets/consts.dart';
import 'package:menus_shibeen/features/home/data/rebos/home_rebo_imple.dart';
import 'package:menus_shibeen/features/home/presentation/manager/all_places_cubit/all_places_cubit.dart';
import 'package:menus_shibeen/features/home/presentation/manager/all_products_cubit/toprated_products_cubit.dart';
import 'package:menus_shibeen/features/home/presentation/manager/recommended_places_cubit/recommended_places_cubit.dart';
import 'package:menus_shibeen/models/place.dart';
import 'package:menus_shibeen/models/product.dart';
import 'package:menus_shibeen/utils/functions.dart';
import 'package:menus_shibeen/utils/simple%20bloc%20observer.dart';
import 'package:menus_shibeen/utils/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // ChangeNotifierProvider(
  //   create: (context) => UserProvider(),
  // );
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(PlaceAdapter());
  Hive.registerAdapter(ProductAdapter());

  await Hive.openBox<Place>(kRecommendedPlacesBox);
  await Hive.openBox<Place>(kAllPlacesBox);
  await Hive.openBox<Product>(kTopRatedProductsBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AllPlacesCubit(getIt.get<HomeReboImple>())..fetchAllPlaces()),
        BlocProvider(
            create: (context) =>
                RecommendedPlacesCubit(getIt.get<HomeReboImple>())
                  ..fetchRecommendedPlaces()),
        BlocProvider(
            create: (context) =>
                TopRatedProductsCubit(getIt.get<HomeReboImple>())
                  ..fetchTopRatedProducts())
      ],
      child: const MaterialApp(
          // title: 'Flutter Demo', theme: ThemeData(),
          home: BottomBar()),
    );
  }
}
