part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent {
}

class AddProductToCart extends ProductDetailsEvent {

  final Product product;

  AddProductToCart(this.product);

}

class AddToWishlistEvent extends ProductDetailsEvent {

  final Product product;

  AddToWishlistEvent(this.product);

}

class LoadProductDetails extends ProductDetailsEvent{
  final String productId;

  LoadProductDetails(this.productId);

}