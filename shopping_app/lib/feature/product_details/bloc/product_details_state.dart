part of 'product_details_bloc.dart';

abstract class ProductDetailsState {

}

class ProductDetailsInitial extends ProductDetailsState {

}

class AddProductToBagFinished extends ProductDetailsState{
  final bool isSuccess;

  AddProductToBagFinished(this.isSuccess);

}
