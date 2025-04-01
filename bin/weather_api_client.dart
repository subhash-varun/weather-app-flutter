import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = "4dad808dda8d0774bfbaaa0c8b79ba6f";

  Future<List<String>> getWeatherData(String city) async {
    final locationUrl =
        Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric');

    final response = await http.get(locationUrl);

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to get weather for $city. Status: ${response.statusCode}');
    }

    final weatherData = jsonDecode(response.body);

    // Extract the required weather information
    final temp = weatherData['main']['temp'];
    final description = weatherData['weather'][0]['description'];
    final humidity = weatherData['main']['humidity'];

    // Return as List<String>
    return [
      'Weather in $city:',
      'Temperature: ${temp.toStringAsFixed(1)}°C',
      'Description: $description',
      'Humidity: $humidity%'
    ];
  }
}
