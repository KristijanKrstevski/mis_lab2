import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_service.dart';
import '../widgets/joke_card.dart';

class RandomJokeScreen extends StatelessWidget {
  final ApiService _apiService = ApiService();

  RandomJokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke of the Day'),
      ),
      body: FutureBuilder<Joke>(
        future: _apiService.getRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.emoji_emotions_outlined,
                    size: 64,
                  ),
                  const SizedBox(height: 15),
                  JokeCard(joke: snapshot.data!),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RandomJokeScreen(),
                        ),
                      );
                    },
                    child: const Text('Get Another Joke'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}