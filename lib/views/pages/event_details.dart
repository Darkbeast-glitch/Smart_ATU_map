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
              Text('Date: ${event.date}'),
              Text('Time: ${event.time}'),
              Text('Venue: ${event.venue}'),
              const SizedBox(height: 8),
              Text(event.description),
              const SizedBox(height: 16),
              if (event.requiresRegistration)
                ElevatedButton(
                  onPressed: () {
                    // Handle registration logic here
                  },
                  child: const Text('Register'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
