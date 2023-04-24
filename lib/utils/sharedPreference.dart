import 'package:shared_preferences/shared_preferences.dart';

class Shr
{
  Future<void> create(String email,String pass)
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("e1", email);
    sharedPreferences.setString("p1", pass);

  }

  Future<Map> read()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? email = sharedPreferences.getString("e1");
    String? pass = sharedPreferences.getString("p1");

    Map m1 = {"e1":email,"p1":pass};
    return m1;

  }
}