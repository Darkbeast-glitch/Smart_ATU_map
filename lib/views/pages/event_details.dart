import 'package:flutter/material.dart';
import 'package:smart_atu_nav/models/event_models.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;

  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(event.imageUrl),
              const SizedBox(height: 16),
              Text(event.name,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    'Date:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Text(event.date),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Time:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Text(event.time),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Venue:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Text(event.venue),
                ],
              ),
              const SizedBox(height: 8),
              Text(event.description),
              const SizedBox(height: 16),
              if (event.requiresRegistration)
                ElevatedButton(
                  onPressed: () {
                    // Handle registration logic here
                  },
                  child: Text('Attend ${event.name}'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
