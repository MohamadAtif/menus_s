part of 'all_products_cubit.dart';

@immutable
sealed class AllProductsState {}

final class AllProductsInitial extends AllProductsState {}

final class AllProductsLoading extends AllProductsState {}

final class AllProductsFailure extends AllProductsState {
  final String errMessage;

  AllProductsFailure({required this.errMessage});
}

final class AllProductsSuccess extends AllProductsState {
  final List<Item> products;
  AllProductsSuccess({required this.products});
}
