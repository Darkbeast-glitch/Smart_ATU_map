# Smart ATU Campus Navigation

## Overview
**Smart ATU Campus Navigation** is a mobile application designed to help students, lecturers, and visitors navigate the Accra Technical University (ATU) campus with ease. The app provides real-time navigation, updates on lecturer availability, event notifications, and a feedback system to improve user experience.

## Features
- **Real-Time Navigation**: Provides step-by-step directions within the ATU campus.
- **Lecturer Availability**: Allows lecturers to update their availability status and students to check if a lecturer is on campus and available.
- **Event Notifications**: Sends real-time notifications about upcoming events on campus.
- **User Feedback**: Users can submit feedback directly through the app, which is stored securely for review.

## Technology Stack
- **Frontend**: Flutter (for cross-platform mobile app development)
- **Backend**: Firebase (Firestore for database, Authentication for user login, Cloud Functions for server-side logic)
- **APIs**: Google Maps API for navigation
- **State Management**: Riverpod (for managing the app's state)
- **Version Control**: Git and GitHub

## Installation

### Prerequisites
- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- A code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- Git: [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/YourUsername/SmartATU.git
   cd SmartATU

2. **Install Dependencies:**
```bash
   flutter pub get

3. **Install Dependencies:**

    - Configure Firebase in your project by following the official guide.
    - Add your google-services.json (for Android) and GoogleService-Info.plist (for iOS) to the project.


## Usage
### User Roles
- Students: Can navigate the campus, view lecturer availability, and receive event notifications.
- Lecturers: Can update their availability status, log in, and create accounts.
- Admins: Can manage user accounts and monitor the app's activity.

## Key Screens
- Login/Sign Up: Allows users to create an account or log in.
- Home Screen: Central hub for navigation, event notifications, and accessing lecturer information.
- Map View: Provides real-time directions and campus navigation.
- Lecturer Tracker: Lists lecturers with their availability status.
- Feedback Form: Users can submit feedback to improve the app.
- Contributing
- We welcome contributions! Please follow these steps to contribute:

Fork the repository.
Create a new branch (git checkout -b feature/YourFeatureName).
Commit your changes (git commit -m 'Add some feature').
Push to the branch (git push origin feature/YourFeatureName).
Open a pull request.
License
This project is licensed under the MIT License - see the LICENSE file for details.

Contact
For any inquiries or issues, please contact: bbjulius900@gmail.com

