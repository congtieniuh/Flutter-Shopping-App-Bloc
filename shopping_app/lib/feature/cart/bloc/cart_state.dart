part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartInit extends CartState {}

class CartLoadFinished extends CartState {
  final Cart cart;

  CartLoadFinished(this.cart);

  @override
  List<Object> get props => [cart];
}