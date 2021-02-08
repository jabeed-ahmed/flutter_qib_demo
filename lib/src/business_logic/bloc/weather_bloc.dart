import 'package:qib_app/src/business_logic/model/weather_model.dart';
import 'package:qib_app/src/business_logic/repository/weather_repository.dart';
import 'package:rxdart/rxdart.dart';

class WeatherBloc {
  final _repository = WeatherRepository();
  final PublishSubject<WeatherModel> _weatherTorontoFetcher =
      new PublishSubject<WeatherModel>();

  final PublishSubject<WeatherModel> _weatherLondonFetcher =
      new PublishSubject<WeatherModel>();

  final PublishSubject<WeatherModel> _weatherNewYorkFetcher =
      new PublishSubject<WeatherModel>();

  bool _isDisposed = false;

  Observable<WeatherModel> get getTorontoWeather =>
      _weatherTorontoFetcher.stream;

  Observable<WeatherModel> get getLondonWeather => _weatherLondonFetcher.stream;

  Observable<WeatherModel> get getNewYorkWeather =>
      _weatherNewYorkFetcher.stream;

  fetchTorontoWeather() async {
    if (_isDisposed) {
      return;
    }
    WeatherModel weatherModel = await _repository.fetchWeatherTorontoService();
    print("Bloc Success!");
    _weatherTorontoFetcher.sink.add(weatherModel);
  }

  fetchNewYorkWeather() async {
    if (_isDisposed) {
      return;
    }
    WeatherModel weatherModel = await _repository.fetchWeatherNewYorkService();
    print("Bloc Success!");
    _weatherLondonFetcher.sink.add(weatherModel);
  }

  fetchLondonWeather() async {
    if (_isDisposed) {
      return;
    }
    WeatherModel weatherModel = await _repository.fetchWeatherLondonService();
    print("Bloc Success!");
    _weatherNewYorkFetcher.sink.add(weatherModel);
  }

  dispose() {
    _weatherTorontoFetcher.close();
    _weatherLondonFetcher.close();
    _weatherNewYorkFetcher.close();
    _isDisposed = true;
  }
}
