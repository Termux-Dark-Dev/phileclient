import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class Forgotpasscheckerservice {
  Future checkEmailForForgotPass(String email) async {
    try {
      var response = await http
          .post(Uri.parse(APIENDPOINTNAME.FORGOTPASSCHECKER + email + "/"));

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
