import 'package:flutter/material.dart';
import 'nav.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Welcome to', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('PRAKTIKUM PAB 2026', style: TextStyle(fontSize: 18)),
              ],
            ),
            Text('1462300209', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Image.asset('assets/996421486322667477.webp', width: 150, height: 150, fit: BoxFit.cover),
            Text('Kharisma Arjuna Dwi Putra', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3498DB),
                foregroundColor: Colors.white,
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => MainNavigation()),
                );
              },
              child: Text('Masuk', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
