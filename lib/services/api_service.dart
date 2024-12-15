import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke.dart';

class ApiService {
  static const String baseUrl = 'https://official-joke-api.appspot.com';

  Future<List<String>> getJokeTypes() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/types'));
      if (response.statusCode == 200) {
        return List<String>.from(json.decode(response.body));
      }
      throw Exception('Failed to load joke types');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Joke>> getJokesByType(String type) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Joke.fromJson(json)).toList();
      }
      throw Exception('Failed to load jokes');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Joke> getRandomJoke() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/random_joke'));
      if (response.statusCode == 200) {
        return Joke.fromJson(json.decode(response.body));
      }
      throw Exception('Failed to load random joke');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}