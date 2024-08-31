import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_atu_nav/models/event_models.dart';
import 'package:smart_atu_nav/repositories/event_repository.dart';

final eventRepositoryProvider = Provider((ref) => EventRepository());

final eventsStreamProvider = StreamProvider<List<Event>>((ref) {
  final repository = ref.read(eventRepositoryProvider);
  return repository.getEvents();
});
