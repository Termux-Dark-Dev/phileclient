import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class BookOrderService {
  Future bookService(List listofsrvc, String selectedtime, String selecteddate,
      String userid, String storeid, String orderdate) async {
    try {
      var data = {
        "servicesopted": listofsrvc,
        "selecteddate": selecteddate,
        "selectedtime": selectedtime,
        "orderdate": orderdate
      };
      var datatobesent = jsonEncode(data);
      var response = await http.post(
          Uri.parse(
              APIENDPOINTNAME.ORDERSERVICE + storeid + "/" + userid + "/"),
          headers: {'Content-Type': 'application/json'},
          body: datatobesent);

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return null;
    }
  }
}
