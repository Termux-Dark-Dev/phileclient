import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';
import 'package:phileclientapp/models/ordermodel.dart';

class UserOrderService {
  Future getOrderdetails(String id) async {
    try {
      var response =
          await http.get(Uri.parse(APIENDPOINTNAME.GETORDERS + id + "/"));
      if (response.statusCode == 200) {
        if (response.body == "[]") {
          return null;
        }
        var listoforders = OrderModel.tojson(json.decode(response.body));
        return listoforders;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
