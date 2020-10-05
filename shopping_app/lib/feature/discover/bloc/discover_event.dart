part of 'discover_bloc.dart';

abstract class DiscoverEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DiscoverUpdatedEvent extends DiscoverEvent {
  final List<Product> products;
  final String category;
  final String productType;

  DiscoverUpdatedEvent({this.products, this.category, this.productType});


  @override
  List<Object> get props => [products, category, productType];
}

class LoadingDiscoverEvent extends DiscoverEvent {
  final String category;
  final String productType;

  LoadingDiscoverEvent({this.category, this.productType});


  @override
  List<Object> get props => [category, productType];
}



class AddDiscoverEvent extends DiscoverEvent {
}
