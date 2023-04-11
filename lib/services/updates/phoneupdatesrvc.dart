import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class UpdatePhoneNumService {
  Future updateUserPhoneNum(String phonenum, String email) async {
    try {
      var body = {"phonenum": phonenum, "email": email};
      var res = await http.put(Uri.parse(APIENDPOINTNAME.UPDATEUSERPHONE),
          body: body,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
          });
      if (res.statusCode == 200) {
        return true;
      } else if (res.statusCode == 400) {
        return false;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
