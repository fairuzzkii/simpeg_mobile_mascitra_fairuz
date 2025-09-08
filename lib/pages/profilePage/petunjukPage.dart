import 'package:flutter/material.dart';
import 'caraAbsensiPage.dart';
import 'caraKegiatanHarianPage.dart';
import 'caraCutiPage.dart';

class PetunjukFilePage extends StatefulWidget {
  const PetunjukFilePage({super.key});

  @override
  State<PetunjukFilePage> createState() => _PetunjukFilePageState();
}

class _PetunjukFilePageState extends State<PetunjukFilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top + 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Grey.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                    SizedBox(width: 0),
                    Text(
                      'Petunjuk',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildPetunjukItem(
                      title: 'Cara Absensi Jam Masuk & Jam Pulang',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CaraAbsensiPage()),
                        );
                      },
                    ),
                    SizedBox(height: 12),
                    _buildPetunjukItem(
                      title: 'Cara Mengisi Kegiatan Harian',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CaraKegiatanHarianPage()),
                        );
                      },
                    ),
                    SizedBox(height: 12),
                    _buildPetunjukItem(
                      title: 'Cara Mengajukan Cuti',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CaraCutiPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetunjukItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey[400],
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}