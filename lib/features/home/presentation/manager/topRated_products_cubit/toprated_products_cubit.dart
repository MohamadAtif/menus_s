import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menus_shibeen/domain/rebos/home_rebo.dart';
import 'package:menus_shibeen/models/product.dart';
import 'package:meta/meta.dart';

part 'top_rated_products_state.dart';

class TopRatedProductsCubit extends Cubit<TopRatedProductsState> {
  TopRatedProductsCubit(this.homeRebo) : super(TopRatedProductsInitial());
  final HomeRebo homeRebo;

  Future<void> fetchTopRatedProducts() async {
    emit(TopRatedProductsLoading());
    var result = await homeRebo.fetchTopRatedProducts();
    result.fold((failure) {
      emit(TopRatedProductsFailure(errMessage: failure.errmessage));
    }, (products) {
      emit(TopRatedProductsSuccess(products: products));
    });
  }
}
