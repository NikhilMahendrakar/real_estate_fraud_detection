
# Real Estate Fraud Detection

This repository contains a real estate fraud detection application built using Flutter and Firebase. The application allows users to add property details, check property status, and update the status of a property.

## Introduction

Real estate fraud is a significant issue that can lead to substantial financial losses. This application aims to detect and prevent fraudulent activities in real estate transactions by leveraging the power of Flutter for the front-end and Firebase for the back-end.

## Features

- **Add Property**: Allows users to add property details to the database.
- **Check Property Status**: Enables users to check the status of a property.
- **Change Property Status**: Allows users to update the status of a property (e.g., from "For Sale" to "Sold").

## Installation

To run this project locally, follow these steps:

1. **Clone the repository**:
    ```sh
    git clone https://github.com/NikhilMahendrakar/real_estate_fraud_detection.git
    cd real_estate_fraud_detection
    ```

2. **Install Flutter**: If you haven't already, install Flutter by following the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).

3. **Set up Firebase**:
    - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
    - Add an Android/iOS app to your Firebase project and follow the setup instructions to download the `google-services.json` or `GoogleService-Info.plist` file.
    - Place the `google-services.json` file in the `android/app` directory for Android, and the `GoogleService-Info.plist` file in the `ios/Runner` directory for iOS.

4. **Install dependencies**:
    ```sh
    flutter pub get
    ```

5. **Run the application**:
    ```sh
    flutter run
    ```

## Usage

### Add Property

1. Navigate to the "Add Property" page from the drawer menu.
2. Fill in the property details including EKhata Number, PINCODE, Registration Number, and Owner Name.
3. Click "Submit" to add the property to the database.

### Check Property Status

1. Navigate to the "Check" page from the drawer menu.
2. Enter the required details including EKhata Number, PINCODE, Registration Number, and Owner Name.
3. Click "Check" to view the status of the property.

### Change Property Status

1. Navigate to the "Change Status" page from the drawer menu.
2. Enter the unique hash value for authentication.
3. Click "Submit" to authenticate and change the status of the property.


### Main Files

- `main.dart`: Entry point of the application. Initializes Firebase and sets up the home page.
- `add.dart`: Contains the logic for adding a new property to the database.
- `check.dart`: Contains the logic for checking the status of a property.
- `StatusAuthentication.dart`: Contains the logic for changing the status of a property.
- `Statuschange.dart`: Handles the status change logic and updates the Firebase database.

## Contributing

Contributions are welcome! If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

Feel free to adjust any section as needed. This README file provides a comprehensive overview of the project, including installation steps, usage instructions, and a brief description of the main files and features.


