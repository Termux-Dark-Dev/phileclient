import 'package:shared_preferences/shared_preferences.dart';

class SARServices {
  Future storeUserDetails(
      String email, String phone, String id, String Username) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      prefs.setString("email", email);
      prefs.setString("id", id);
      prefs.setString("phone", phone);
      prefs.setString("username", Username);
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

  Future getUserName() async {
    var prefs = await SharedPreferences.getInstance();
    var name = prefs.getString("username");
    return name;
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

  Future getUserDetails() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var email = prefs.getString("email");
      var id = prefs.getString("id");
      var phone = prefs.getString("phone");
      var username = prefs.getString("username");
      return {"id": id, "email": email, "phone": phone, "username": username};
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logoutUser() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    return true;
  }
}
