import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/feature/discover/model/product.dart';
import 'package:shopping_app/feature/product_details/dao/product_details_dao.dart';

part 'product_details_event.dart';

part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsDao _productDetailsDao;

  ProductDetailsBloc()
      : _productDetailsDao = ProductDetailsDao(),
        super(ProductDetailsInitial());

  @override
  Stream<ProductDetailsState> mapEventToState(
      ProductDetailsEvent event,) async* {
    if (event is AddProductToCart) {
      yield* _mapAddProductToBagToState(event);
    }
  }

  Stream<ProductDetailsState> _mapAddProductToBagToState(
      AddProductToCart event) async* {
    await _productDetailsDao.insertProductToCart(event.product);

    yield AddProductToBagFinished(true);
  }
}
