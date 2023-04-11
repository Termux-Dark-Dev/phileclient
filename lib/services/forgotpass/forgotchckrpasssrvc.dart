import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class Forgotpasscheckerservice {
  Future checkEmailForForgotPass(String email) async {
    try {
      var body = {"email": email};
      var response = await http.post(
          Uri.parse(APIENDPOINTNAME.FORGOTPASSCHECKER),
          body: body,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
          });

      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 400) {
        return false;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
