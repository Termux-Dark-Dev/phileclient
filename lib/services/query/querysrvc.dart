import 'package:http/http.dart' as http;
import 'package:phileclientapp/apiname.dart';

class QueryService {
  Future querySrvc(String userid, String query) async {
    try {
      var response = await http.post(
          Uri.parse(APIENDPOINTNAME.RAISEQUERY + userid + "/" + query + "/"));

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
