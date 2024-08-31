
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_atu_nav/models/event_models.dart';

class EventRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Event>> getEvents() {
    return _firestore.collection('events').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Event.fromJson(doc.data());
      }).toList();
    });
  }
}
