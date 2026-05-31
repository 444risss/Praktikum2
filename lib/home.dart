import 'package:flutter/material.dart';
import 'buku.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar header full width tanpa rounded corner
              Image.network(
                'https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=800',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 28),

              // Menu buttons dengan padding
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _tombolMenu(context, 'Fiksi & Novel'),
                    SizedBox(height: 12),
                    _tombolMenu(context, 'Teknologi & IT'),
                    SizedBox(height: 12),
                    _tombolMenu(context, 'Sains & Matematika'),
                    SizedBox(height: 12),
                    _tombolMenu(context, 'Sejarah Dunia'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tombolMenu(BuildContext context, String judul) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BukuPage(kategori: judul),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          judul,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
