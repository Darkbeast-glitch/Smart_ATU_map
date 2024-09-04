import 'package:flutter/material.dart';
import 'package:smart_atu_nav/models/lecturer_models.dart';

class LecturerDetailPage extends StatelessWidget {
  final Lecturer lecturer;

  const LecturerDetailPage({super.key, required this.lecturer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lecturer.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/profile.png")),
            ),
            const SizedBox(height: 20),
            Text(
              'Name: ${lecturer.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Department: ${lecturer.department}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  lecturer.onCampus ? Icons.check_circle : Icons.cancel,
                  color: lecturer.onCampus ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 10),
                Text(
                  lecturer.onCampus ? 'On Campus' : 'Off Campus',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  lecturer.busy ? Icons.cancel : Icons.check_circle,
                  color: lecturer.busy ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 10),
                Text(
                  lecturer.busy ? 'Busy' : 'Not Busy',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: lecturer.onCampus && !lecturer.busy
                    ? () {
                        // Implement navigation to the lecturer's office here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar:
                                  AppBar(title: const Text('Lecturer Office')),
                              body: Center(
                                child: Text(
                                    'Navigate to ${lecturer.name}\'s office'),
                              ),
                            ),
                          ),
                        );
                      }
                    : null,
                child: const Text('Navigate to Office'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
