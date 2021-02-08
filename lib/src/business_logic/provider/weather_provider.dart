import 'package:http/http.dart' as http;
import 'package:qib_app/src/business_logic/model/weather_model.dart';

String getTorontoWeatherURL = 'https://run.mocky.io/v3/d74a58ba-94f9-41d8-b133-1b70b7129815';
String getLondonWeatherURL = 'https://run.mocky.io/v3/dd7b3627-4a71-4785-a2ec-2434a4d23704';
String getNewYorkWeatherURL = 'https://run.mocky.io/v3/160e075e-68f7-4119-be0d-b864ff15be75';

class GetWeatherService {

  Future<WeatherModel> fetchWeatherTorontoService() async {
    final response =
    await http.get(getTorontoWeatherURL);

    if (response.statusCode == 200) {
      print("Success!");
      return weatherModelFromJson(response.body);
    } else {
      // If that response was not OK, throw an error.
      print("Failed!");
      return weatherModelFromJson(response.body);
    }
  }

  Future<WeatherModel> fetchWeatherLondonService() async {
    final response =
    await http.get(getLondonWeatherURL);

    if (response.statusCode == 200) {
      print("Success!");
      return weatherModelFromJson(response.body);
    } else {
      // If that response was not OK, throw an error.
      print("Failed!");
      return weatherModelFromJson(response.body);
    }
  }

  Future<WeatherModel> fetchWeatherNewYorkService() async {
    final response =
    await http.get(getNewYorkWeatherURL);

    if (response.statusCode == 200) {
      print("Success!");
      return weatherModelFromJson(response.body);
    } else {
      // If that response was not OK, throw an error.
      print("Failed!");
      return weatherModelFromJson(response.body);
    }
  }
}