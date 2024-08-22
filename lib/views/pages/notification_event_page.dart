import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_atu_nav/models/event_models.dart';
import 'package:smart_atu_nav/providers/event_provider.dart';
import 'package:smart_atu_nav/utils/constants.dart';
import 'package:smart_atu_nav/views/pages/event_details.dart';

class NotificationAndEventPage extends ConsumerWidget {
  const NotificationAndEventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventStream = ref.watch(eventsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Page',
          style: AppConstants.titleTextStyle.copyWith(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: eventStream.when(
        data: (events) {
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return EventCard(event: event);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // the event image starts onthe container
              Container(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:111396713.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1829704122.
                width: 100,
                height: 100,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:380001934.
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(event.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //  the there is a column
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // the event name
                  Text(
                    event.name,
                    style: const TextStyle(
                        // the event description goes here

                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),

                  // the event description goes here

                  Text(
                    event.shortDesc.length > 35
                        ? '${event.shortDesc.substring(0, 10)}...' // Truncate to 50 characters and add ellipsis
                        : event
                            .shortDesc, // Show the full text if it's within the limit
                    style: const TextStyle(fontSize: 14),
                  ),

                  // the button goese here now
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EventDetailPage(event: event),
                        ),
                      );
                    },
                    child: const Text('More Details'),
                  ),
                ],
              )

              // the column has there:

              // the envent name

              // under it there is the event description

              // then the button for more details
            ],
          ),
        ));
  }
}
// 
