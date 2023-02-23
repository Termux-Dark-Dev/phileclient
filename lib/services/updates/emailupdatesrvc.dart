import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class UpdateEmailService {
  Future updateUserEmail(String id, String email) async {
    try {
      var res = await http.put(
          Uri.parse(APIENDPOINTNAME.UPDATEUSEREMAIL + id + "/" + email + "/"));

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
