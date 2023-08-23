// BLoC
// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memberships_ui/data/repository/store_repository.dart';
import '../events/store_bloc_event.dart';
import '../models/store_model.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepository _store = StoreRepository();
  StoreBloc() : super(StoreState([])) {
    // FetchStoreEvent mapped.
    on<FetchStoreEvent>((event, emit) async {
      List<Store> fetchedStores = await _store.fetchStoresFromApi();
      emit(StoreState(fetchedStores));
    });

    on<FetchStoreByIdEvent>(
      (event, emit) async {
        Store fetchedStore = await _store.fetchStoreByIdFromApi(event.storeId);
        emit(StoreState([fetchedStore]));
      },
    );

    on<AddStoreEvent>(
      (event, emit) async {
        Store addedStore = await _store.addStoreFromApi(event.store);
        emit(StoreState([...state.stores, addedStore]));
      },
    );

    on<UpdateStoreEvent>(
      (event, emit) async {
        Store updatedStore = await _store.updateStoreFromApi(event.store);
        print("StoreId updated is ${updatedStore.id}");
        final updatedStores = state.stores.map((store) {
          return store.id == event.store.id ? event.store : store;
        }).toList();
        emit(StoreState(updatedStores));
      },
    );

    on<DeleteStoreEvent>(
      (event, emit) async {
        String deletedId = await _store.deleteStoreFromApi(event.storeId);
        print("Id deleted $deletedId");
        emit(StoreState(
            state.stores.where((store) => store.id != event.storeId).toList()));
      },
    );
  }
}
