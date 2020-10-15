import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/feature/discover/model/product.dart';
import 'package:shopping_app/feature/product_details/repository/product_details_repository.dart';

part 'product_details_event.dart';

part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsRepository _productDetailsDao;

  ProductDetailsBloc()
      : _productDetailsDao = ProductDetailsRepository(),
        super(ProductDetailsInitial());

  @override
  Stream<ProductDetailsState> mapEventToState(
    ProductDetailsEvent event,
  ) async* {
    if (event is AddProductToCart) {
      yield* _mapAddProductToBagToState(event);
    } else if (event is AddToWishlistEvent) {
      yield* _mapAddToWishlistEventToState(event);
    } else if (event is LoadProductDetails) {
      yield* _mapLoadProductDetailsEventToState(event);
    }
  }

  Stream<ProductDetailsState> _mapAddProductToBagToState(
      AddProductToCart event) async* {
    await _productDetailsDao.insertProductToCart(event.product);

    yield AddProductToBagFinished(true);
  }

  Stream<ProductDetailsState> _mapAddToWishlistEventToState(
      AddToWishlistEvent event) async* {
    await _productDetailsDao.addToWishlist(event.product);

    add(LoadProductDetails(event.product.id));
  }

  Stream<ProductDetailsState> _mapLoadProductDetailsEventToState(
      LoadProductDetails event) async* {
    var product = await _productDetailsDao.getProductDetails(event.productId);

    yield LoadProductDetailsFinished(product);
  }
}
