import 'package:memberships_ui/models/store_model.dart';

// Declaring all the Events and its classes

abstract class StoreEvent {}

class FetchStoreEvent extends StoreEvent {}

class FetchStoreByIdEvent extends StoreEvent {
  final String storeId;

  FetchStoreByIdEvent(this.storeId);
}

class AddStoreEvent extends StoreEvent {
  final Store store;

  AddStoreEvent(this.store);
}

class UpdateStoreEvent extends StoreEvent {
  final Store store;

  UpdateStoreEvent(this.store);
}

class DeleteStoreEvent extends StoreEvent {
  final String storeId;

  DeleteStoreEvent(this.storeId);
}

// Define the Store State
class StoreState {
  final List<Store> stores;

  StoreState(this.stores);
}
