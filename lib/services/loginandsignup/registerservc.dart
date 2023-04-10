import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class RegisterService {
  Future registeruser(
      String email, String password, String phone, String username) async {
    try {
      var body = {
        "useremail": email,
        "username": username,
        "password": password,
        "phoneno": phone
      };
      var response = await http.post(
        Uri.parse(APIENDPOINTNAME.CREATEUSER),
        body: body,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 401) {
        return null;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
