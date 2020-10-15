part of 'product_details_bloc.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class AddProductToBagFinished extends ProductDetailsState {
  final bool isSuccess;

  AddProductToBagFinished(this.isSuccess);
}

class AddToWishlistFinished extends ProductDetailsState {
  final bool isSuccess;

  AddToWishlistFinished(this.isSuccess);
}

class LoadProductDetailsFinished extends ProductDetailsState {
  final Product product;

  LoadProductDetailsFinished(this.product);
}
