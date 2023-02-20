import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

import '../../models/availtimemodel.dart';

class Getavailtimeservice {
  Future getAvailableTimeOfDay(String storeid, String date) async {
    try {
      var response = await http.get(
          Uri.parse(APIENDPOINTNAME.GETAVAILTIME + storeid + "/" + date + "/"));
      if (response.statusCode == 200) {
        if (response.body == "[]") {
          return true;
        } else {
          print(response.body);
          var list = Availtime.tojson(json.decode(response.body));
          print(list);
          return list;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
