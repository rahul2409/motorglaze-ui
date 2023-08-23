import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:memberships_ui/models/store_model.dart';

class StoreRepository {
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
}
