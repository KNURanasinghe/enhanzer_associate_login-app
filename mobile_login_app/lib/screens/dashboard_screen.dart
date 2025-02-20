import 'package:flutter/material.dart';
import 'package:mobile_login_app/screens/login_screen.dart';

import '../db/db_helper.dart';

class DashboardScreen extends StatefulWidget {
  final Map<String, dynamic> apiResponse;
  const DashboardScreen(
    this.apiResponse, {
    super.key,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _saveUserData();
  }

  Future<void> _saveUserData() async {
    if (widget.apiResponse['Response_Body'] != null &&
        widget.apiResponse['Response_Body'].isNotEmpty) {
      final user = widget.apiResponse['Response_Body'][0];
      await DBHelper().insertUser({
        'User_Code': user['User_Code'],
        'User_Display_Name': user['User_Display_Name'],
        'Email': user['Email'],
        'User_Employee_Code': user['User_Employee_Code'],
        'Company_Code': user['Company_Code'],
      });
      setState(() {
        userData = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white70),
        child: Center(
          child: userData == null
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome, ${userData!['User_Display_Name']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Email: ${userData!['Email']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'User Code: ${userData!['User_Code']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Company Code: ${userData!['Company_Code']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Company Code: ${userData!['User_Employee_Code']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
