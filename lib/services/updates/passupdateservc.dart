import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class UpdatePassService {
  Future updateUserPass(String email, String currpass, String newpass) async {
    try {
      var res = await http.post(Uri.parse(APIENDPOINTNAME.UPDATEUSERPASS +
          email +
          "/" +
          currpass +
          "/" +
          newpass +
          "/"));

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
