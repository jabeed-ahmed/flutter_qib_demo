import 'package:qib_app/src/business_logic/model/weather_model.dart';
import 'package:qib_app/src/business_logic/provider/weather_provider.dart';

class WeatherRepository {
  final fetchWeatherApiProvider = GetWeatherService();

  Future<WeatherModel> fetchWeatherTorontoService() =>
      fetchWeatherApiProvider.fetchWeatherTorontoService();

  Future<WeatherModel> fetchWeatherLondonService() =>
      fetchWeatherApiProvider.fetchWeatherLondonService();

  Future<WeatherModel> fetchWeatherNewYorkService() =>
      fetchWeatherApiProvider.fetchWeatherNewYorkService();
}
