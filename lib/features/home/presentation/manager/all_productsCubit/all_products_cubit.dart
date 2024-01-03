import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menus_shibeen/domain/rebos/home_rebo.dart';
import 'package:menus_shibeen/domain/rebos/products_rebo.dart';
import 'package:menus_shibeen/models/product.dart';
import 'package:meta/meta.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this.productsRebo) : super(AllProductsInitial());
  final ProductsRepo productsRebo;

  Future fetchAllProducts() async {
    emit(AllProductsLoading());
    var result = await productsRebo.fetchAllProducts();
    result.fold((failure) {
      emit(AllProductsFailure(errMessage: failure.errmessage));
    }, (products) {
      emit(AllProductsSuccess(products: products));
    });
  }
}
