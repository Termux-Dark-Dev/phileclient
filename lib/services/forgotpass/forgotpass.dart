import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class ForgotPassService {
  Future chnagePass(String email, String password) async {
    try {
      var body = {"email": email, "password": password};
      var response = await http.post(
          Uri.parse(APIENDPOINTNAME.FORGOTPASSCHANGE),
          body: body,
          headers: {
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
