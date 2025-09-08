import 'package:flutter/material.dart';

class CaraAbsensiPage extends StatefulWidget {
  const CaraAbsensiPage({super.key});

  @override
  State<CaraAbsensiPage> createState() => _CaraAbsensiPageState();
}

class _CaraAbsensiPageState extends State<CaraAbsensiPage> {
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
                    Expanded(
                      child: Text(
                        'Cara Absensi Jam Masuk & Jam Pulang',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
              child: Container(
                margin: EdgeInsets.all(16),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Langkah-langkah Absensi:',
                      style: TextStyle(
                        color: Color(0xFFC64304),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildStep(
                      number: '1',
                      title: 'Buka Aplikasi',
                      description: 'Buka aplikasi absensi di smartphone Anda dan pastikan sudah login dengan akun yang terdaftar.',
                    ),
                    _buildStep(
                      number: '2',
                      title: 'Pilih Menu Absensi',
                      description: 'Pada halaman utama, pilih menu "Absensi" atau tombol absen yang tersedia.',
                    ),
                    _buildStep(
                      number: '3',
                      title: 'Aktifkan Location/GPS',
                      description: 'Pastikan GPS/lokasi pada smartphone Anda sudah aktif untuk memverifikasi lokasi absensi.',
                    ),
                    _buildStep(
                      number: '4',
                      title: 'Ambil Foto Selfie',
                      description: 'Ambil foto selfie sesuai dengan ketentuan yang berlaku (pencahayaan cukup, wajah terlihat jelas).',
                    ),
                    _buildStep(
                      number: '5',
                      title: 'Pilih Jam Masuk/Pulang',
                      description: 'Pilih opsi "Jam Masuk" untuk absensi datang atau "Jam Pulang" untuk absensi pulang.',
                    ),
                    _buildStep(
                      number: '6',
                      title: 'Submit Absensi',
                      description: 'Tekan tombol "Submit" atau "Kirim" untuk mengirim data absensi Anda.',
                      isLast: true,
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.amber[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info_outline, color: Colors.amber[700], size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Catatan Penting:',
                                style: TextStyle(
                                  color: Colors.amber[700],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            '• Pastikan Anda berada di lokasi yang telah ditentukan\n• Absensi hanya dapat dilakukan pada jam kerja yang telah ditetapkan\n• Foto selfie harus jelas dan sesuai dengan wajah yang terdaftar di sistem',
                            style: TextStyle(
                              color: Colors.amber[700],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildStep({
    required String number,
    required String title,
    required String description,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Color(0xFFC64304),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}