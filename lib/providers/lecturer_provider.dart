import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_atu_nav/models/lecturer_models.dart';

final lecturerProvider = StreamProvider.family<List<Lecturer>, String>((ref, department) {
  return FirebaseFirestore.instance
      .collection('departments')
      .doc(department)
      .collection('lecturers')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            return Lecturer.fromJson(data);
          }).toList());
});
