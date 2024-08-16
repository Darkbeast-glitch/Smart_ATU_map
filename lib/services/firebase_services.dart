// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:your_project_name/models/event_model.dart'; // Adjust import based on actual location

// class FirebaseService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Fetch events from Firestore
//   Future<List<Event>> getEvents() async {
//     try {
//       final QuerySnapshot snapshot = await _firestore.collection('events').get();
//       final List<Event> events = snapshot.docs
//           .map((doc) => Event.fromFirestore(doc.data() as Map<String, dynamic>))
//           .toList();
//       return events;
//     } catch (e) {
//       print('Error fetching events: $e');
//       return [];
//     }
//   }
  
//   // Example: Fetch event by ID
//   Future<Event?> getEventById(String id) async {
//     try {
//       final DocumentSnapshot doc = await _firestore.collection('events').doc(id).get();
//       if (doc.exists) {
//         return Event.fromFirestore(doc.data() as Map<String, dynamic>);
//       }
//       return null;
//     } catch (e) {
//       print('Error fetching event by ID: $e');
//       return null;
//     }
//   }

//   // Example: Add or update event
//   Future<void> addOrUpdateEvent(Event event) async {
//     try {
//       await _firestore.collection('events').doc(event.id).set(event.toMap());
//     } catch (e) {
//       print('Error adding/updating event: $e');
//     }
//   }

//   // Example: Delete event
//   Future<void> deleteEvent(String id) async {
//     try {
//       await _firestore.collection('events').doc(id).delete();
//     } catch (e) {
//       print('Error deleting event: $e');
//     }
//   }
// }
