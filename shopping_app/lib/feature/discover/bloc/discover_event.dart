part of 'discover_bloc.dart';

abstract class DiscoverEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DiscoverUpdatedEvent extends DiscoverEvent {
  final List<Product> products;

  DiscoverUpdatedEvent(this.products);

  @override
  List<Object> get props => [products];
}

class LoadingDiscoverEvent extends DiscoverEvent {

}


class AddDiscoverEvent extends DiscoverEvent {

}
