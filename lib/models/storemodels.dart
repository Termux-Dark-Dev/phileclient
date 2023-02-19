import 'dart:convert';

class StoreModel {
  late String id, name, address;
  late String? storeimage;
  StoreModel(
      {required this.id,
      required this.name,
      required this.address,
      required this.storeimage});

  static List<StoreModel> tojson(List<dynamic> data) {
    List<StoreModel> storemodelobjlist = [];

    for (var item in data) {
      storemodelobjlist.add(StoreModel(
          id: item["id"].toString(),
          name: item["StoreName"].toString(),
          address: item['Address'],
          storeimage: item['StoreFrontImagePath']));
    }

    return storemodelobjlist;
  }
}
