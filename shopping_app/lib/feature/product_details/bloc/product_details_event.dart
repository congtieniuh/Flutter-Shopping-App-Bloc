part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
}

class AddProductToCart extends ProductDetailsEvent {

  final Product product;

  AddProductToCart(this.product);

  @override
  List<Object> get props => [product];

}