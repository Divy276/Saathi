# Personal Safety Assistant Flutter App

A Flutter application designed to provide users with quick access to safety features.

## Features

*   **SOS Alert:** Quickly send an SMS with a distress message to an emergency number (e.g., 112). Requires SMS permissions.
*   **Helpline Call:** Directly call a women's helpline number (e.g., 1092).
*   **Emergency Contacts:**
    *   View a list of predefined emergency contacts.
    *   Delete contacts from the list.
*   **Safety Shield (UI only):** A visual indicator for safety status (currently UI only, not functional).
*   **Safety Score (UI only):** Displays a safety score (currently static, not based on real-time data).

## Getting Started

This is a Flutter module project. To run this application:

1.  **Ensure Flutter is installed:** Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).
2.  **Clone the repository (if you haven't already):**
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```
3.  **Get dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the app:**
    ```bash
    flutter run
    ```

This should launch the app on a connected device or emulator.

## How to Use

*   **Home Screen:** The main screen displays your safety status (Shield) and safety score.
*   **SOS Alert:** Tap the "SOS alert" button to initiate sending an emergency SMS. You might be prompted for SMS permissions if not already granted.
*   **Helpline:** Tap the "Helpline" button to initiate a call to the predefined helpline number.
*   **Emergency Contacts:**
    *   Scroll down to see your list of emergency contacts.
    *   To remove a contact, tap the delete (trash can) icon next to their details.

## Current Limitations & Future Improvements

*   **Static Safety Score:** The safety score is currently a static value. Future versions could integrate with location services and external data to provide a dynamic, real-time safety score.
*   **Non-Functional Shield:** The "Shield" activation is currently a UI element only and does not trigger any backend services or change in protective status. This could be expanded to arm/disarm various safety monitoring features.
*   **Hardcoded Initial Contacts:** Emergency contacts are initially hardcoded. Functionality to add new contacts via the UI should be implemented.
*   **Limited Customization:** SOS message content and emergency/helpline numbers are hardcoded. These could be made configurable by the user.
*   **Menu Button:** The menu button in the app bar is currently non-functional.

## Contributing

Contributions are welcome! If you have suggestions or want to improve the app, please feel free to fork the repository, make your changes, and submit a pull request.
