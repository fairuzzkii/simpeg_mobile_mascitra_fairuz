import 'dart:ui' as BorderType;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simpeg_mascitra_mobile/pages/cutiPage/pengajuanBerhasilPage.dart';
import 'package:simpeg_mascitra_mobile/pages/cutiPage/pilihTanggalPage.dart';

class PengajuanCutiPage extends StatefulWidget {
  const PengajuanCutiPage({super.key});

  @override
  State<PengajuanCutiPage> createState() => _PengajuanCutiPageState();
}

class _PengajuanCutiPageState extends State<PengajuanCutiPage> {
  List jenisCuti = [
    'Cuti Izin Keperluan Khusus',
    'Cuti Sakit',
    'Cuti Tanpa Dibayar',
    'Cuti Bersalin/Mendampingi Persalinan',
    'Cuti Tahunan (Tahun Kontrak)',
  ];

  String? selectedJenisCuti;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                        'Pengajuan Cuti',
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

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PilihTanggalPage(),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(16),
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
                                  Row(
                                    children: [
                                      Text(
                                        'Pilih Data',
                                        style: TextStyle(
                                          color: Color(0xFFC64304),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Tidak Ada Aata',
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
                              color: Color(0xFFC64340),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
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
                      child: DottedBorder(
                        options: RectDottedBorderOptions(
                          color: Colors.grey[500]!,
                          dashPattern: [5, 5],
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/images/pdf.png',
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Drop your file(s) here, or Browse',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Supports: PDF, JPG, PNG (Max file 1 MB)',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedJenisCuti,
                        style: TextStyle(color: Colors.black),
                        underline: SizedBox(), // hilangkan garis bawah
                        hint: const Text(
                          'Select permission type',
                          style: TextStyle(fontSize: 14, fontFamily: "Poppins"),
                        ),
                        items: jenisCuti.map((jenis) {
                          return DropdownMenuItem<String>(
                            value: jenis,
                            child: Text(
                              jenis,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedJenisCuti = value;
                          });
                        },
                      ),
                    ),

                    _inputForm('Alasan Cuti', 'Write Here'),
                    _inputForm('Catatan Cuti (Opsional)', 'Write Here'),
                    _inputForm('Alamat Selama Menjalankan Cuti', 'Write Here'),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      margin: EdgeInsets.only(bottom: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PengajuanBerhasilPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFC64304),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Ajukan',
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
}

Widget _inputForm(String label, String placeHolder) {
  return Container(
    margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        SizedBox(height: 4),
        TextField(
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
          ),
        ),
      ],
    ),
  );
}
