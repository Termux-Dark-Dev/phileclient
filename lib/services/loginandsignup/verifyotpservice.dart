import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class VerifyOTPService {
  Future verifyOTP(String email, String otp) async {
    try {
      var response = await http
          .post(Uri.parse(APIENDPOINTNAME.VERIFYOTP + email + "/" + otp + "/"));

      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 401) {
        return "Otp Mismatch";
      } else if (response.statusCode == 400) {
        return false;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
