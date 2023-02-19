import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class SendOtpService {
  Future sendOTP(String email) async {
    try {
      var response =
          await http.post(Uri.parse(APIENDPOINTNAME.GENERATEOTP + email + "/"));
      print(APIENDPOINTNAME.GENERATEOTP);
      print(response.body);
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
