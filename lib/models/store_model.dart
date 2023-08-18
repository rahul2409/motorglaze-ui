class Store {
  final String id;
  final String location;
  final String type;
  final String storeOwner;
  final DateTime creationDate;
  final String storeName;

  Store(
      {required this.id,
      required this.location,
      required this.storeOwner,
      required this.type,
      required this.creationDate,
      required this.storeName});

  // Convert store object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location,
      'type': type,
      'storeOwner': storeOwner,
      'creationDate': creationDate.toIso8601String(),
      'storeName': storeName
    };
  }

  // Convert Store object from JSON
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
        id: json['id'],
        location: json['location'],
        type: json['type'],
        storeOwner: json['storeOwner'],
        creationDate: DateTime.parse(json['creationDate']),
        storeName: json['storeName']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
