import 'package:shared_preferences/shared_preferences.dart';

class SARServices {
  Future storeUserDetails(String email, String phone, String id) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      prefs.setString("email", email);
      prefs.setString("id", id);
      prefs.setString("phone", phone);
      return true;
    } on Exception catch (e) {
      // TODO
      return e.toString();
    }
  }

  Future getUserId() async {
    var prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    return id;
  }

  static Future isUserLoggedIn() async {
    var prefs = await SharedPreferences.getInstance();
    var res = prefs.getString("id");
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }
}
