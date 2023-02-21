import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class RegisterService {
  Future registeruser(
      String email, String password, String phone, String Username) async {
    try {
      var response = await http.post(Uri.parse(APIENDPOINTNAME.CREATEUSER +
          Username +
          "/" +
          email +
          "/" +
          password +
          "/" +
          phone +
          "/"));
      print(response.body);
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
