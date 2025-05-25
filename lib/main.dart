import 'package:flutter/material.dart';
import 'package:mini_reminder/screens/home/home_screen.dart';
import 'package:mini_reminder/services/notification_handler.dart';

import 'database/db_helper.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper().database;
  await NotificationHelper.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16),
          bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
          titleLarge: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      home: HomeScreen(),
    );
  }
}