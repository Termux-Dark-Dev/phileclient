import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class ForgotPassService {
  Future chnagePass(String email, String password) async {
    try {
      var response = await http.post(Uri.parse(
          APIENDPOINTNAME.FORGOTPASSCHANGE + email + "/" + password + "/"));

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
