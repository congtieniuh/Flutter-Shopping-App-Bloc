import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/feature/discover/model/product.dart';
import 'package:shopping_app/feature/discover/repository/discover_repository.dart';
import 'package:shopping_app/feature/discover/repository/firebase_discover_repository.dart';

part 'discover_event.dart';

part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverRepository _discoverRepository;
  StreamSubscription _streamSubscription;

  DiscoverBloc()
      : _discoverRepository = FirebaseDiscoverRepository(),
        super(DiscoverLoading());

  @override
  Stream<DiscoverState> mapEventToState(
    DiscoverEvent event,
  ) async* {
    if (event is LoadingDiscoverEvent) {
      yield* _mapLoadDiscoverEvent(event);
    } else if (event is DiscoverUpdatedEvent) {
      yield* _mapDiscoverUpdatedEventToState(event);
    } else if (event is LoadingWishlistEvent) {
      yield* _mapLoadWishlistEvent(event);
    } else if (event is WishlistUpdatedEvent) {
      yield* _mapWishlistUpdatedEventToState(event);
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  Stream<DiscoverState> _mapLoadDiscoverEvent(
      LoadingDiscoverEvent event) async* {
    _streamSubscription =
        _discoverRepository.getListProduct().listen((products) {
      add(DiscoverUpdatedEvent(
          products: products,
          category: event.category,
          productType: event.productType));
    });
  }

  Stream<DiscoverState> _mapDiscoverUpdatedEventToState(
      DiscoverUpdatedEvent event) async* {
    var filterList = event.products.where((element) {
      return element.productType == event.productType &&
          element.category == event.category;
    }).toList();

    yield DiscoverLoadFinished(products: filterList, isSuccess: true);
  }

  Stream<DiscoverState> _mapLoadWishlistEvent(
      LoadingWishlistEvent event) async* {
    _discoverRepository.getListProduct().listen((event) {
      var filterList = event.where((element) {
        return element.isFavourite;
      }).toList();
      add(WishlistUpdatedEvent(products: filterList));
    });
  }

  Stream<DiscoverState> _mapWishlistUpdatedEventToState(
      WishlistUpdatedEvent event) async* {
    yield WishlistLoadFinished(products: event.products, isSuccess: true);
  }
}
