import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/feature/cart/models/cart_item.dart';
import 'package:shopping_app/feature/cart/repository/cart_repository.dart';
import 'package:shopping_app/feature/cart/repository/cart_repository_local.dart';

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
    if(event is CartLoadingEvent){
      yield* _mapCartUpdatedEventToState(event);
    }
  }

  Stream<CartState> _mapCartUpdatedEventToState(CartEvent event) async* {
    var result = await _cartRepositoryLocal.getCartItems();
    yield CartLoadFinished(result);
  }
}
