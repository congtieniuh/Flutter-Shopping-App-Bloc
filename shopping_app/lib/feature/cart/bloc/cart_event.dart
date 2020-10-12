part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CartItemUpdated extends CartEvent {
  final List<CartItem> cartItems;

  CartItemUpdated(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class CartLoadingEvent extends CartEvent {
}


class ChangeQuantityCartItem extends CartEvent {
  final Product product;
  final int value;
  final CartItem cartItem;

  ChangeQuantityCartItem(this.product, this.value, this.cartItem);

  @override
  List<Object> get props => [product, value, cartItem];
}

