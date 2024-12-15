import 'package:flutter/material.dart';

class TypeCard extends StatelessWidget {
  final String type;
  final VoidCallback onTap;

  const TypeCard({Key? key, required this.type, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Icon(
                Icons.emoji_emotions,
                size: 40,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 5),
              Text(
                type.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}