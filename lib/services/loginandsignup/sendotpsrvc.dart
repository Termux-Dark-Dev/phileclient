import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class SendOtpService {
  Future sendOTP(String email) async {
    try {
      var body = {"email": email};
      var response = await http
          .post(Uri.parse(APIENDPOINTNAME.GENERATEOTP), body: body, headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
