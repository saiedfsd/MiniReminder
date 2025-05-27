📱 Mini Reminder App
A simple and intuitive Flutter-based mobile application that helps users manage daily tasks and reminders with ease. Users can add, edit, delete, and toggle reminders, and receive timely notifications using local scheduling.

🚀 Features
✅ Add, Edit, and Delete Reminders

⏰ Schedule Local Notifications

🗃️ Store Reminders Locally with SQLite

🗂️ Categorize Tasks

🔔 Toggle Notifications On/Off

🧹 Swipe-to-Delete with Confirmation

💡 Clean and User-Friendly Interface

🛠️ Technologies Used
Flutter (UI Framework)

Dart (Programming Language)

sqflite (Local SQLite Database)

path_provider (Database Path Handling)

flutter_local_notifications (Local Notifications)

📸 Screenshots
You can add screenshots here once available.

![Screenshot_20250528_025422](https://github.com/user-attachments/assets/3394dd30-5b2c-475d-af7a-4b2090bc6f75)
![Screenshot_20250528_025412](https://github.com/user-attachments/assets/ef35ce05-37fa-4f96-8003-a38ef6c29a0e)
![Screenshot_20250528_025335](https://github.com/user-attachments/assets/ff93bbff-dee7-442a-accd-bfd7e47a0e49)


📦 Getting Started
Prerequisites
Flutter SDK installed

A device or emulator to run the app

Installation
Clone the repository:

git clone https://github.com/yourusername/mini_reminder.git
cd mini_reminder

Install dependencies:

flutter pub get

Run the app:
flutter run

📂 Project Structure
lib/
├── database/
│   └── db_helper.dart
├── screens/
│   ├── home/
│   │   └── home_screen.dart
│   ├── add_reminder/
│   │   └── add_edit_reminder_screen.dart
│   └── reminder_detail_screen/
│       └── reminder_detail_screen.dart
├── services/
│   └── notification_handler.dart
│   └── permission_handler.dart
└── main.dart

🤝 Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you'd like to change.

📃 License
MIT License
