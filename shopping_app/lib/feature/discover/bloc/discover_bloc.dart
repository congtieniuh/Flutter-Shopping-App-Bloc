import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
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
      yield* _mapLoadDiscoverEvent();
    } else if (event is DiscoverUpdatedEvent) {
      yield* _mapDiscoverUpdatedEventToState(event);
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  Stream<DiscoverState> _mapLoadDiscoverEvent() async* {
    _streamSubscription =
        _discoverRepository.getListProduct().listen((products) {
      add(DiscoverUpdatedEvent(products));
    });
  }

  Stream<DiscoverState> _mapDiscoverUpdatedEventToState(
      DiscoverUpdatedEvent event) async* {
    yield DiscoverLoadFinished(products: event.products, isSuccess: true);
  }
}
