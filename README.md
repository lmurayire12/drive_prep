# DrivePrep App

## Overview
DrivePrep is a mobile application designed to help individuals in Rwanda prepare for their driving tests by providing. The app provides a comprehensive learning experience through interactive study materials, practice tests, and real-time feedback mechanisms.

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

 ## Overview of the Development Process and Tools
For the development of DrivePrep, a structured approach was adopted to ensure clear progress and efficient collaboration. The project was managed using Miro, a versatile online collaboration platform for managing requirements, tasks, and project milestones. This tool was particularly useful in organizing the project into one-week sprints, making it easier to track progress and address any bottlenecks promptly. Tasks were broken down into smaller components, allowing for a more focused approach to development.
To clarify the app’s functionality, use-case diagrams and flowcharts were created. These visual aids played an essential role in understanding the user experience and the system’s behavior in various states. They provided insight into the features available to both regular users and administrators, ensuring that no key functionality was overlooked during the build process.
The core tool used for the mobile development of DrivePrep was the Flutter framework, written in Dart. Flutter is known for its flexibility and fast performance across multiple platforms. To work with Flutter, the Flutter SDK was installed, either through cloning the repository from GitHub or using the official documentation. For debugging, Android Studio was utilized to handle Android device emulation . Alongside, the Android SDK were required to be set as environment variables, ensuring a smooth Flutter development experience.
Dependencies essential for the project, such as Firebase Authentication and other Google services, were listed in the pubspec.yaml file. This file manages the project's libraries and external packages. Commands like flutter pub get were used to ensure that these packages were properly integrated, facilitating functionalities such as handling user authentication and accessing real-time data.


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



