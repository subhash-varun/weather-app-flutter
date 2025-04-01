import 'weather_api_client.dart';
import 'dart:io';

void main() async {
  final api = WeatherApiClient();

  stdout.write('Enter a city name: ');
  final city = stdin.readLineSync();

  if (city == null || city.isEmpty) {
    print('Error: City name cannot be empty');
    return;
  }

  try {
    print('Fetching weather data for $city...');
    final weatherInfo = await api.getWeatherData(city);

    // Print each line of weather information
    for (final line in weatherInfo) {
      print(line);
    }
  } catch (e) {
    print('Error: $e');
  }
}
