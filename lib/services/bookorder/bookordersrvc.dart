import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class BookOrderService {
  Future<void> addOrderInSpreadSheet(List listofsrvc, String datetime,
      String userid, String storeid, String orderid) async {
    try {
      var body = {
        "serviceopted": listofsrvc.toString(),
        "datetime": datetime,
        "userid": userid,
        "storeid": storeid,
        "orderid": orderid
      };

      var response = await http.post(
          Uri.parse(APIENDPOINTNAME.ADDORDERTOSPREADSHEET),
          body: body,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
          });
      return;
    } catch (e) {
      return;
    }
  }

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
        await addOrderInSpreadSheet(listofsrvc, selecteddate + selectedtime,
            userid, storeid, jsonDecode(response.body)["orderid"].toString());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return null;
    }
  }
}
