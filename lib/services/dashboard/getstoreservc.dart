import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

import '../../models/storemodels.dart';

class GetStoreDetails {
  Future getStoreData(String latitude, String longitude) async {
    try {
      var response = await http.get(Uri.parse(
          APIENDPOINTNAME.STOREDETAILS + latitude + "/" + longitude + "/"));

      if (response.statusCode == 200) {
        var storedata = StoreModel.tojson(json.decode(response.body));
        return storedata;
      } else {
        return null;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
