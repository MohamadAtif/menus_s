part of 'toprated_products_cubit.dart';

@immutable
sealed class TopRatedProductsState {}

final class TopRatedProductsInitial extends TopRatedProductsState {}

final class TopRatedProductsLoading extends TopRatedProductsState {}

final class TopRatedProductsFailure extends TopRatedProductsState {
  final String errMessage;

  TopRatedProductsFailure({required this.errMessage});
}

final class TopRatedProductsSuccess extends TopRatedProductsState {
  final List<Product> products;
  TopRatedProductsSuccess({required this.products});
}
