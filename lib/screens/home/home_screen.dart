import 'package:flutter/material.dart';
import 'package:mini_reminder/database/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _reminders = [];

  @override
  void initState() {
    super.initState();
    _loadReminders();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Reminders',
              style: TextStyle(
                  color: Colors.teal
              ),
            ),
            iconTheme: IconThemeData(
                color: Colors.teal
            ),
            leading: Icon(
                Icons.alarm
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {

          },
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
          ),
        )
    );
  }

  Future<void> _loadReminders() async {
    final reminders = await DbHelper.getReminders();
    setState(() {
      _reminders = _reminders;
    });
  }
}