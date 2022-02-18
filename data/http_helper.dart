
import 'package:globo_fitness/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
 // https://api.openweathermap.org/data/2.5/
 // weather?q=Ibadan&appid=93265dc1647d2fb7b5434d68e0426d58
 final String authority = 'api.openweathermap.org';
 final String path = 'data/2.5/weather';
 final String apiKey = '93265dc1647d2fb7b5434d68e0426d58';

//Synchronous programming is when lines of codes executes sequencially
 Future<Weather> getWeather(String location) async{
   Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
   Uri uri = Uri.https(authority, path, parameters);
   http.Response result = await http.get(uri); 
   Map<String, dynamic> data = json.decode(result.body);
   Weather weather = Weather.fromJson(data);
   return weather;

 }
}