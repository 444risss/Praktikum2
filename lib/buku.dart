import 'package:flutter/material.dart';
import 'nav.dart';

class BukuPage extends StatelessWidget {
  final String kategori;
  const BukuPage({super.key, required this.kategori});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF3498DB),
        foregroundColor: Colors.white,
        title: Text(kategori),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://images.unsplash.com/photo-1519682337058-a94d519337bc?w=400',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text('Hujan', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50))),
              SizedBox(height: 6),
              Text('Tere Liye', style: TextStyle(fontSize: 16, color: Color(0xFF7F8C8D))),
              SizedBox(height: 12),
              Text(
                'Novel ini adalah kisah tentang persahabatan, cinta, dan melupakan, berlatar masa depan setelah bencana besar.',
                style: TextStyle(fontSize: 14, color: Color(0xFF5D6D7E), height: 1.5),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  _badge('320 Hal'),
                  SizedBox(width: 10),
                  _badge('Bahasa Indo'),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3498DB),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => _popupPinjam(context),
                  child: Text('Pinjam Buku', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainNavigation(initialIndex: index)));
          },
          selectedItemColor: Color(0xFF3498DB),
          unselectedItemColor: Color(0xFF7F8C8D),
          iconSize: 28,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Buku'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Color(0xFFE8F4F8), borderRadius: BorderRadius.circular(8)),
      child: Text(text, style: TextStyle(color: Color(0xFF3498DB), fontWeight: FontWeight.w600, fontSize: 13)),
    );
  }

  void _popupPinjam(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Column(
          children: [
            Icon(Icons.book_rounded, size: 48, color: Color(0xFF3498DB)),
            SizedBox(height: 12),
            Text('Konfirmasi Pinjam', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2C3E50))),
          ],
        ),
        content: Text('Apakah Anda yakin ingin meminjam buku ini?\nBatas waktu: 7 hari.', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF5D6D7E))),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Batal', style: TextStyle(color: Color(0xFF7F8C8D)))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF3498DB), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Buku berhasil dipinjam'), backgroundColor: Color(0xFF27AE60)));
            },
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }
}
