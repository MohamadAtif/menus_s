// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:menus_shibeen/domain/failure_rebo.dart';
// import 'package:menus_shibeen/domain/rebos/products_rebo.dart';
// import 'package:menus_shibeen/models/product.dart';
// import 'package:menus_shibeen/services/api_service.dart';

// class ProductaRepoImplementation implements ProductsRepo {
//   final ApiService apiService;

//   ProductaRepoImplementation({required this.apiService});
//   @override
//   Future<Either<Failure, List<Product>>> fetchAllProducts() async {
//     try {
//       print('productsbefore');
//       var data = await apiService.get('/api/get-all-products');
//       List<Product> products = [];
//       for (var item in data['products']) {
//         products.add(Product.fromMap(item));
//       }
//       //error because the '}' was after return products
//       return right(products);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFaliure.formDioException(e));
//       }
//       return left(ServerFaliure(e.toString()));
//     }
//   }

//   // @override
//   // Future<Either<Failure, List<Product>>> fetchTopRatedProducts() {
//   //   // TODO: implement fetchTopRatedProducts
//   //   throw UnimplementedError();
//   // }
// }
