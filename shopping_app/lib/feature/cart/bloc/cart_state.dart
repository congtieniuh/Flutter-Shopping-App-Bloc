part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartInit extends CartState {}

class CartLoadFinished extends CartState {
  final List<CartItem> cartItems;

  CartLoadFinished(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}