import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

import '../../models/availtimemodel.dart';

class Getavailtimeservice {
  Future getAvailableTimeOfDay(
      String userid, String storeid, String date) async {
    try {
      var response = await http.get(Uri.parse(APIENDPOINTNAME.GETAVAILTIME +
          userid +
          "/" +
          storeid +
          "/" +
          date +
          "/"));
      if (response.statusCode == 200) {
        if (response.body == "[]") {
          return true;
        } else {
          var newlist = [];
          var list = json.decode(response.body);
          for (var item in list) {
            newlist.add(item["ServiceTime"].toString());
          }
          return newlist;
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
