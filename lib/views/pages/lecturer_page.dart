import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_atu_nav/providers/lecturer_provider.dart';
import 'package:smart_atu_nav/views/pages/lect_details.dart';

class LecturerTrackerPage extends ConsumerStatefulWidget {
  const LecturerTrackerPage({super.key});

  @override
  _LecturerTrackerPageState createState() => _LecturerTrackerPageState();
}

class _LecturerTrackerPageState extends ConsumerState<LecturerTrackerPage> {
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    // This can be a dropdown or any other method to select the department
    String selectedDepartment = 'Computer Science';

    // Use the provider with the selected department
    final lecturersAsyncValue = ref.watch(lecturerProvider(selectedDepartment));

    return Scaffold(
      appBar: AppBar(title: const Text('Lecturer Tracker')),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search Lecturer',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchTerm = value;
                });
              },
            ),
          ),

          // Lecturer List
          Expanded(
            child: lecturersAsyncValue.when(
              data: (lecturers) {
                // Filter lecturers based on the search term
                final filteredLecturers = lecturers.where((lecturer) {
                  return lecturer.name
                      .toLowerCase()
                      .contains(_searchTerm.toLowerCase());
                }).toList();

                // If no lecturers are found
                if (filteredLecturers.isEmpty) {
                  return const Center(child: Text('No lecturers found.'));
                }

                // Displaying the list of lecturers
                return ListView.builder(
                  itemCount: filteredLecturers.length,
                  itemBuilder: (context, index) {
                    final lecturer = filteredLecturers[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                      title: Text(lecturer.name),
                      subtitle: Text(lecturer.department),
                      onTap: () {
                        // Navigate to Lecturer Detail Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LecturerDetailPage(
                              lecturer: lecturer,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
