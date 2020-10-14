import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/feature/cart/models/cart.dart';
import 'package:shopping_app/feature/cart/models/cart_item.dart';
import 'package:shopping_app/feature/cart/repository/cart_repository.dart';
import 'package:shopping_app/feature/cart/repository/cart_repository_local.dart';
import 'package:shopping_app/feature/discover/model/product.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepository _cartRepositoryLocal;

  CartBloc()
      : _cartRepositoryLocal = CartRepositoryLocal(),
        super(CartInit());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartLoadingEvent) {
      yield* _mapCartUpdatedEventToState(event);
    } else if (event is ChangeQuantityCartItem) {
      yield* _mapCartChangeQuantitEventToState(event);
    } else if (event is RemoveCartItem) {
      yield* _mapRemoveCartItemEventToState(event);
    }
  }

  Stream<CartState> _mapCartUpdatedEventToState(CartEvent event) async* {
    var result = await _cartRepositoryLocal.getCartItems();
    yield CartLoadFinished(result);
  }

  Stream<CartState> _mapCartChangeQuantitEventToState(
      ChangeQuantityCartItem event) async* {
    await _cartRepositoryLocal.updateQuantity(event.product, event.value);
    var result = await _cartRepositoryLocal.getCartItems();
    yield CartLoadFinished(result);
  }

  Stream<CartState> _mapRemoveCartItemEventToState(
      RemoveCartItem event) async* {
    await _cartRepositoryLocal.removeCartItem(event.cartItem);
    var result = await _cartRepositoryLocal.getCartItems();
    yield CartLoadFinished(result);
  }
}
