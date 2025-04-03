# DrivePrep App

## Overview
DrivePrep is a mobile application designed to help individuals in Rwanda prepare for their driving tests. The app provides a comprehensive learning experience through interactive study materials, practice tests, and real-time feedback mechanisms.

## Features
- **User Authentication**: Secure login and registration using Firebase Authentication.
- **Study Materials**: Access to driving theory content and traffic rules.
- **Practice Tests**: Timed and untimed practice tests with real-time feedback.
- **Progress Tracking**: Monitor user performance and improvement over time.
- **State Management**: Utilizes `StatefulWidget` and `setState()` for UI updates.
- **Database Integration**: Firebase Realtime Database for storing user data and test results.
- **Offline Access**: Uses `SharedPreferences` to store key data locally.

## Technologies Used
- **Frontend**: Flutter (Dart)
- **Backend**: Firebase Realtime Database & Firebase Authentication
- **State Management**: `StatefulWidget` and `setState()`
- **Local Storage**: SharedPreferences

## App Architecture
The project follows a clean architecture approach:
```
lib/
│── main.dart  # Entry point of the app
│── screens/   # UI screens
│

```
This structure ensures **scalability, maintainability, and ease of debugging**.

## Database & Backend Integration
The app integrates Firebase Realtime Database to perform CRUD operations:
- **Create**: Users can sign up and store test results.
- **Read**: Fetch practice test questions and user progress.
- **Update**: Modify user scores and track improvement.
- **Delete**: Remove outdated test records.

## State Management
DrivePrep uses **StatefulWidget** and **setState()** for managing UI updates. This approach is simple and effective for handling dynamic data changes, such as updating test scores and user progress in real time.

## Testing & Debugging
- **Testing**: Conducted manual testing for UI responsiveness, authentication, and CRUD functionality.
- **Debugging**: Used Flutter DevTools and Firebase Debugging tools to troubleshoot errors.

## Technical Challenges & Solutions
| Challenge | Solution |
|-----------|----------|
| Syncing real-time data in Firebase | Implemented Firebase listeners for real-time updates |
| Managing state efficiently | Used `setState()` effectively to refresh UI dynamically |
| Ensuring authentication security | Used Firebase Authentication with encrypted passwords |

## Next Steps
1. **Enhance UI/UX**: Improve visual design and animations.
2. **Add More Tests**: Expand the question bank for a more comprehensive learning experience.
3. **Deploy on Play Store**: Publish the app for wider accessibility.

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/driveprep.git
   ```
2. Navigate to the project directory:
   ```sh
   cd driveprep
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## Team
TEAM CONTRIBUTIONS
Team Member
Role
Key Contributions
Taiwo
Frontend Developer
- Set up Flutter project, structured folder layout. - Converted Figma design to Flutter UI. - Integrated Firebase Authentication for login/signup. - Connected UI with backend features (data fetching, profiles). - UI testing and optimization.
Chimdalu
Frontend Developer
- Assisted in project setup and UI components. - Implemented Google Sign-In and Email/Password Authentication. - Ensured smooth navigation post-authentication. - Conducted UI testing and fixed responsiveness issues.
Lievin
Backend Developer
- Set up Firebase project and Authentication. - Developed CRUD operations for user data (posts, comments). - Integrated Firestore with Firebase Authentication. - API testing and bug fixes.
Ivan
Backend Developer
- Designed ERD and finalized Firestore database structure. - Implemented Firestore CRUD operations. - Applied Firebase security rules. - Optimized database queries and debugged errors.
Ange Kevine
Project Manager/Lead
- Coordinated team tasks and timelines. - Managed GitHub repository, branches, and version control. - Monitored frontend-backend integration. - Reviewed Firebase authentication and CRUD functionality. - Managed final testing and deployment preparations.



