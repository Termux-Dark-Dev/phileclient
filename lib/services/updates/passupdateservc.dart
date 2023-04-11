import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class UpdatePassService {
  Future updateUserPass(String email, String currpass, String newpass) async {
    try {
      var body = {"currpass": currpass, "newpass": newpass, "email": email};
      var res = await http.post(Uri.parse(APIENDPOINTNAME.UPDATEUSERPASS),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
          },
          body: body);

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
