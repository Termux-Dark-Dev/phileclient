import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class QueryService {
  Future querySrvc(String userid, String query) async {
    try {
      var body = {"usrid": userid, "query": query};
      var response = await http
          .post(Uri.parse(APIENDPOINTNAME.RAISEQUERY), body: body, headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return null;
    }
  }
}
