import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather.dart';

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};
    var url = Uri.https(authority, path, parameters);
    http.Response result = await http.get(url);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
