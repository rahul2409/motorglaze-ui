// BLoC
// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../events/store_bloc_event.dart';
import '../models/store_model.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreState([])) {
    // FetchStoreEvent mapped.
    on<FetchStoreEvent>((event, emit) async {
      List<Store> fetchedStores = await fetchStoresFromApi();
      emit(StoreState(fetchedStores));
    });

    on<FetchStoreByIdEvent>(
      (event, emit) async {
        Store fetchedStore = await fetchStoreByIdFromApi(event.storeId);
        emit(StoreState([fetchedStore]));
      },
    );

    on<AddStoreEvent>(
      (event, emit) async {
        Store addedStore = await addStoreFromApi(event.store);
        emit(StoreState([...state.stores, addedStore]));
      },
    );

    on<UpdateStoreEvent>(
      (event, emit) async {
        Store updatedStore = await updateStoreFromApi(event.store);
        print("StoreId updated is ${updatedStore.id}");
        final updatedStores = state.stores.map((store) {
          return store.id == event.store.id ? event.store : store;
        }).toList();
        emit(StoreState(updatedStores));
      },
    );

    on<DeleteStoreEvent>(
      (event, emit) async {
        String deletedId = await deleteStoreFromApi(event.storeId);
        print("Id deleted $deletedId");
        emit(StoreState(
            state.stores.where((store) => store.id != event.storeId).toList()));
      },
    );
  }
}

Future<String> deleteStoreFromApi(String storeId) async {
  final response =
      await http.delete(Uri.parse('http://10.0.2.2:8080/api/store/$storeId'));
  try {
    if (response.statusCode == 200) {
      final String jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData;
    } else {
      return throw Exception("Could not delete store");
    }
  } catch (e) {
    return "";
  }
}

Future<Store> updateStoreFromApi(Store store) async {
  final url = Uri.parse('http://10.0.2.2:8080/api/store');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode(store.toJson());

  //Sending the put request in the form url, header, body
  final response = await http.put(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    final updatedStoreData = json.decode(response.body);
    final updatedStore = Store.fromJson(updatedStoreData);
    print('Store Updated successfully');
    return updatedStore;
  } else {
    throw Exception('Store failed to update');
  }
}

Future<List<Store>> fetchStoresFromApi() async {
  final url = Uri.parse('http://10.0.2.2:8080/api/store');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final List<dynamic> storeDataList = json.decode(response.body);
    final List<Store> stores =
        storeDataList.map((json) => Store.fromJson(json)).toList();
    return stores;
  } else {
    throw Exception('Store list not found');
  }
}

Future<Store> fetchStoreByIdFromApi(String id) async {
  final url = Uri.parse('http://10.0.2.2:8080/api/store/$id');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final storeData = json.decode(response.body);
    final store = Store.fromJson(storeData);
    return store;
  } else {
    throw Exception('Store not found! Please try again');
  }
}

Future<Store> addStoreFromApi(Store store) async {
  final url = Uri.parse('http://10.0.2.2:8080/api/store');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode(store);
  print(' body $body url $url');
  // Sending post request in the format url, headers, body
  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    final addedStoreData = json.decode(response.body);
    final addedStore = Store.fromJson(addedStoreData);
    return addedStore;
  } else {
    throw Exception(response.statusCode);
  }
}
