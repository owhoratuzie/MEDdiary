# med_diary

#### Video Demo:  <URL https://youtu.be/Q4DHB3vHX74>
#### Description: MEDdiary is a cross-platform mobile app built with Flutter for recording blood pressure and blood glucose levels daily and calculating their average. Welcome Screen: collects and stores user data (name and date of birth).The entry screen collects the user's blood pressure and blood glucose levels, and stores them in a database along with their timestamp.The diary screen displays blood pressure and blood glucose data that has been stored. It also displays a total average of blood pressure and blood glucose from all entries in the diary.The setting screen allows the user to switch between light and dark modes.

#### Technical Details: MEDdiary is built using Flutter, a cross-platform framework that allows it to run on both iOS and Android. The app uses a local SQLite database to store blood pressure, blood glucose readings, and timestamps. It also includes a settings screen to switch between light and dark modes for improved user accessibility. Flutter’s state management techniques, along with its UI toolkit, made it possible to create a smooth and responsive experience across platforms.

#### User Experience: Welcome Screen: Users input and store their name and date of birth when first launching the app. Entry Screen: Users can input their blood pressure and blood glucose levels, which are saved with a timestamp to the database. Diary Screen: The app displays previously recorded data along with a calculated average of all the recorded entries for blood pressure and blood glucose. Settings Screen: Users can toggle between light and dark modes to personalize their experience.

#### Challenges and Solutions: One of the main challenges faced during development was managing state across different screens and ensuring smooth database operations. This was overcome by using Flutter’s state management tools such as Provider and SQLite integration, which made handling data between the screens seamless. Another challenge was implementing the dark mode toggle, which required making sure that the UI updated dynamically across the entire app, achieved by leveraging Flutter’s theme management capabilities.

#### Future Improvements There are several features planned for future updates. One of the key improvements is adding notifications to remind users to input their data daily, enhancing adherence to the tracking routine. Another planned feature is the ability to export data as a PDF or CSV file, allowing users to share their health data with doctors or caregivers easily. Additionally, integrating cloud storage to sync data across multiple devices is a future goal.

A new Flutter project.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
