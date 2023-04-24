import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practical_exam/screens/api/model/apiModel.dart';

class apiHelper {
  Future<Weather> getApi() async {
    String link = "https://corona-virus-world-and-india-data.p.rapidapi.com/api";

    Uri uri = Uri.parse(link);

    var response = await http.get(uri, headers: {
      "content-type": "application/octet-stream",
      "X-RapidAPI-Key": "88130da9c0mshfc722e959c1e7bbp182b77jsn147ea36d443e",
      "X-RapidAPI-Host": "corona-virus-world-and-india-data.p.rapidapi.com"
    });

    var json = jsonDecode(response.body);

    Weather w1 = Weather.fromJson(json);
    return w1;


  }
}