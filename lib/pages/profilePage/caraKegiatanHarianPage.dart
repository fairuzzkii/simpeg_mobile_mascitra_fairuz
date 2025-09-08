import 'package:flutter/material.dart';

class CaraKegiatanHarianPage extends StatefulWidget {
  const CaraKegiatanHarianPage({super.key});

  @override
  State<CaraKegiatanHarianPage> createState() => _CaraKegiatanHarianPageState();
}

class _CaraKegiatanHarianPageState extends State<CaraKegiatanHarianPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Header - sama dengan DataAkunPage
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
                        'Cara Mengisi Kegiatan Harian',
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
                      'Langkah-langkah Mengisi Kegiatan Harian:',
                      style: TextStyle(
                        color: Color(0xFFC64304),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildStep(
                      number: '1',
                      title: 'Akses Menu Kegiatan',
                      description: 'Buka aplikasi dan pilih menu "Kegiatan Harian" atau "Laporan Kegiatan" pada halaman utama.',
                    ),
                    _buildStep(
                      number: '2',
                      title: 'Pilih Tanggal',
                      description: 'Pilih tanggal yang ingin Anda isi kegiatan harian. Biasanya untuk hari ini atau hari kerja sebelumnya.',
                    ),
                    _buildStep(
                      number: '3',
                      title: 'Isi Deskripsi Kegiatan',
                      description: 'Tuliskan deskripsi kegiatan yang telah Anda lakukan dengan jelas dan detail. Gunakan bahasa yang formal dan profesional.',
                    ),
                    _buildStep(
                      number: '4',
                      title: 'Tentukan Jam Mulai & Selesai',
                      description: 'Isi waktu mulai dan selesai untuk setiap kegiatan yang Anda laporkan. Pastikan waktu yang diisi sesuai dengan kegiatan yang dilakukan.',
                    ),
                    _buildStep(
                      number: '5',
                      title: 'Pilih Kategori Kegiatan',
                      description: 'Pilih kategori atau jenis kegiatan yang sesuai (misalnya: Rapat, Tugas Lapangan, Administrasi, dll).',
                    ),
                    _buildStep(
                      number: '6',
                      title: 'Upload Dokumentasi',
                      description: 'Jika diperlukan, upload foto atau dokumen pendukung sebagai bukti pelaksanaan kegiatan.',
                    ),
                    _buildStep(
                      number: '7',
                      title: 'Review dan Submit',
                      description: 'Periksa kembali semua data yang telah diisi, pastikan sudah benar, kemudian tekan tombol "Submit" atau "Kirim".',
                      isLast: true,
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.tips_and_updates_outlined, color: Colors.blue[700], size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Tips Mengisi Kegiatan:',
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            '• Isi kegiatan setiap hari secara rutin\n• Gunakan bahasa yang jelas dan mudah dipahami\n• Sertakan hasil atau output dari kegiatan yang dilakukan\n• Pastikan total jam kegiatan sesuai dengan jam kerja',
                            style: TextStyle(
                              color: Colors.blue[700],
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