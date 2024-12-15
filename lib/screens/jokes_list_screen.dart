import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_service.dart';
import '../widgets/joke_card.dart';

class JokesListScreen extends StatelessWidget {
  final String jokeType;
  final ApiService _apiService = ApiService();

  JokesListScreen({Key? key, required this.jokeType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${jokeType.toUpperCase()} Jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: _apiService.getJokesByType(jokeType),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              return JokeCard(joke: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}