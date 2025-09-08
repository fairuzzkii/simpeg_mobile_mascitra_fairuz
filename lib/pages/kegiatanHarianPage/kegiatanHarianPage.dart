import 'package:flutter/material.dart';
import 'package:simpeg_mascitra_mobile/pages/kegiatanHarianPage/pilihTanggalHarianPage.dart';
import 'package:simpeg_mascitra_mobile/pages/kegiatanHarianPage/riwayatHarianPage.dart';
import 'package:simpeg_mascitra_mobile/pages/kegiatanHarianPage/successKegiatan.dart';

class KegiatanHarianPage extends StatefulWidget {
  const KegiatanHarianPage({super.key});

  @override
  State<KegiatanHarianPage> createState() => _KegiatanHarianPageState();
}

class _KegiatanHarianPageState extends State<KegiatanHarianPage> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();
  final TextEditingController _realisasiController = TextEditingController();

  bool _isFormValid() {
    return _tanggalController.text.isNotEmpty &&
           _deskripsiController.text.trim().isNotEmpty &&
           _targetController.text.trim().isNotEmpty &&
           _realisasiController.text.trim().isNotEmpty;
  }

  void _navigateToDatePicker() async {
    final String? result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => DatePickerPage(
          initialDate: _tanggalController.text.isEmpty ? null : _tanggalController.text,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _tanggalController.text = result;
      });
    }
  }

  void _submitForm() {
    if (_isFormValid()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const KegiatanBerhasilPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mohon lengkapi semua field yang diperlukan'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            // Header
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
                        'Kegiatan Harian',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RiwayatKegiatanHarianPage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.history,
                          color: Colors.white,
                          size: 24,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    
                    // Tanggal Kegiatan
                    _buildDateField(),
                    
                    // Deskripsi Kegiatan
                    _inputForm(
                      'Deskripsi Kegiatan', 
                      'Write Here', 
                      _deskripsiController,
                      required: true,
                    ),
                    
                    // Target Kegiatan
                    _inputForm(
                      'Target Kegiatan', 
                      'Write Here', 
                      _targetController,
                      required: true,
                    ),
                    
                    // Realisasi Kegiatan
                    _inputForm(
                      'Realisasi Kegiatan', 
                      'Write Here', 
                      _realisasiController,
                      required: true,
                    ),

                    // Submit Button
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      margin: EdgeInsets.only(bottom: 16),
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFC64304),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Send',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return Container(
      margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tanggal Kegiatan',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(height: 4),
          GestureDetector(
            onTap: _navigateToDatePicker,
            child: Container(
              padding: EdgeInsets.all(16),
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
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.calendar_today,
                      color: Color(0xFFC64304),
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pilih Tanggal',
                          style: TextStyle(
                            color: Color(0xFFC64304),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          _tanggalController.text.isEmpty 
                              ? 'Tidak Ada Data' 
                              : _tanggalController.text,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xFFC64304),
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputForm(String label, String placeHolder, TextEditingController controller, {bool required = false}) {
    return Container(
      margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              if (required)
                Text(
                  ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
            ],
          ),
          SizedBox(height: 4),
          TextField(
            controller: controller,
            maxLines: 3,
            enableSuggestions: true,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: placeHolder,
              hintStyle: TextStyle(color: Colors.black26),
              filled: true,
              fillColor: Color.fromARGB(255, 233, 233, 233),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFC64304), width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}