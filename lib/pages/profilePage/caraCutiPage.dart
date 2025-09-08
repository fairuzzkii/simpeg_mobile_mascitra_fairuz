import 'package:flutter/material.dart';

class CaraCutiPage extends StatefulWidget {
  const CaraCutiPage({super.key});

  @override
  State<CaraCutiPage> createState() => _CaraCutiPageState();
}

class _CaraCutiPageState extends State<CaraCutiPage> {
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
                        'Cara Mengajukan Cuti',
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
                      'Langkah-langkah Mengajukan Cuti:',
                      style: TextStyle(
                        color: Color(0xFFC64304),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildStep(
                      number: '1',
                      title: 'Buka Menu Pengajuan Cuti',
                      description: 'Masuk ke aplikasi dan pilih menu "Pengajuan Cuti" atau "Cuti" pada halaman utama.',
                    ),
                    _buildStep(
                      number: '2',
                      title: 'Pilih Jenis Cuti',
                      description: 'Pilih jenis cuti yang akan diajukan (Cuti Tahunan, Cuti Sakit, Cuti Melahirkan, dll) sesuai dengan kebutuhan.',
                    ),
                    _buildStep(
                      number: '3',
                      title: 'Tentukan Tanggal Cuti',
                      description: 'Pilih tanggal mulai dan tanggal berakhir cuti. Pastikan tanggal yang dipilih sesuai dengan rencana cuti Anda.',
                    ),
                    _buildStep(
                      number: '4',
                      title: 'Isi Alasan Cuti',
                      description: 'Tuliskan alasan pengajuan cuti dengan jelas dan detail. Berikan penjelasan yang logis dan mudah dipahami.',
                    ),
                    _buildStep(
                      number: '5',
                      title: 'Upload Dokumen Pendukung',
                      description: 'Jika diperlukan, upload dokumen pendukung seperti surat keterangan dokter (untuk cuti sakit) atau dokumen lainnya.',
                    ),
                    _buildStep(
                      number: '6',
                      title: 'Pilih Atasan/Approver',
                      description: 'Pilih atasan atau pihak yang berwenang untuk menyetujui pengajuan cuti Anda.',
                    ),
                    _buildStep(
                      number: '7',
                      title: 'Review dan Submit',
                      description: 'Periksa kembali semua data yang telah diisi, pastikan sudah lengkap dan benar, kemudian submit pengajuan.',
                    ),
                    _buildStep(
                      number: '8',
                      title: 'Tunggu Persetujuan',
                      description: 'Setelah submit, tunggu persetujuan dari atasan. Anda akan mendapat notifikasi status persetujuan melalui aplikasi.',
                      isLast: true,
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.orange[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.warning_amber_outlined, color: Colors.orange[700], size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Hal yang Perlu Diperhatikan:',
                                style: TextStyle(
                                  color: Colors.orange[700],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            '• Ajukan cuti minimal 3 hari sebelum tanggal cuti\n• Pastikan sisa cuti tahunan Anda masih mencukupi\n• Serahkan pekerjaan kepada rekan kerja yang ditunjuk\n• Cuti akan berlaku setelah mendapat persetujuan atasan',
                            style: TextStyle(
                              color: Colors.orange[700],
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