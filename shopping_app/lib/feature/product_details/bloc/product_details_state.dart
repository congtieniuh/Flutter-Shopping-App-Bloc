part of 'product_details_bloc.dart';

abstract class ProductDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {

}

class AddProductToBagFinished extends ProductDetailsState{
  final bool isSuccess;

  AddProductToBagFinished(this.isSuccess);

  @override
  List<Object> get props => [isSuccess];
}
