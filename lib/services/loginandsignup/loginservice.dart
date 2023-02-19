import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';
import 'package:phileclientapp/services/SAR/sarservices.dart';

class LoginService {
  Future Login(String email, String pass) async {
    try {
      var response = await http
          .get(Uri.parse(APIENDPOINTNAME.LOGINUSER + email + '/' + pass + '/'));
      if (response.statusCode == 200) {
        var usrid = jsonDecode(response.body)["id"].toString();
        var phonenumber = jsonDecode(response.body)["phonenumber"].toString();
        SARServices obj = SARServices();
        var res = await obj.storeUserDetails(email, phonenumber, usrid);
        if (res == true) {
          return true;
        } else {
          return res;
        }
      } else if (response.statusCode == 401) {
        return false;
      } else {
        return null;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
