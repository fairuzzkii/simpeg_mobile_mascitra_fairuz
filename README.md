# simpeg_mascitra_mobile

A new Flutter project.

## Getting Started

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidilan_app_v2nw/core/utils/formatter.dart';
import 'package:sidilan_app_v2nw/features/laporan/bloc/report_bloc.dart';
import 'package:sidilan_app_v2nw/features/laporan/bloc/report_event.dart';
import 'package:sidilan_app_v2nw/features/laporan/bloc/report_state.dart';
import 'package:sidilan_app_v2nw/features/laporan/data/models/report_model.dart';
import 'package:sidilan_app_v2nw/features/laporan/presentation/pages/report_detail_page.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int _entriesToShow = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3A7BFD),
              Colors.white,
            ],
            stops: [0.0, 0.3],
          ),
        ),
        child: Column(
          children: [
            // Custom AppBar
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back_ios,
                            color: Colors.black, size: 18),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Data Laporan',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),

            // Filter Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: _buildFilterDropdown(
                              label: 'Filter Bulan',
                              icon: Icons.keyboard_arrow_down)),
                      const SizedBox(width: 10),
                      Expanded(
                          child: _buildFilterDropdown(
                              label: 'Filter Tahun',
                              icon: Icons.keyboard_arrow_down)),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Action buttons
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton('Reset Filter',
                            Colors.grey.shade800, Icons.refresh),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildActionButton(
                            'Export Filter', Colors.green, Icons.file_download),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton('Import Laporan', Colors.white,
                            Icons.file_upload,
                            textColor: Colors.black,
                            borderColor: Colors.grey.shade300),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildActionButton(
                            'Tambah Laporan', const Color(0xFF3A7BFD), Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // List Data
            Expanded(
              child: BlocBuilder<ReportBloc, ReportState>(
                builder: (context, state) {
                  if (state is ReportLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF3A7BFD)),
                      ),
                    );
                  } else if (state is ReportLoaded) {
                    if (state.reports.isEmpty) {
                      return _buildEmptyState();
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      itemCount: state.reports.length > _entriesToShow
                          ? _entriesToShow
                          : state.reports.length,
                      itemBuilder: (context, index) {
                        final report = state.reports[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ReportDetailPage(report: report),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Header Row dengan INFO badge dan action buttons
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF3A7BFD),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          'INFO',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        ReportDetailPage(
                                                            report: report))),
                                            child: Container(
                                              width: 24,
                                              height: 24,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF3A7BFD),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.search,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () => debugPrint("✏️ Edit"),
                                            child: Container(
                                              width: 24,
                                              height: 24,
                                              decoration: const BoxDecoration(
                                                color: Colors.orange,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () => debugPrint("🗑 Delete"),
                                            child: Container(
                                              width: 24,
                                              height: 24,
                                              decoration: const BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),

                                  // Content
                                  _buildInfoRow("Pilih KBLI:", report.kbli?.name ?? "-"),
                                  const SizedBox(height: 8),
                                  _buildInfoRow("Perusahaan:", report.company.name),
                                  const SizedBox(height: 8),
                                  _buildInfoRow("Nilai Produksi:", "Rp ${Formatter.formatNumber(report.productionValue)}"),
                                  const SizedBox(height: 8),
                                  _buildInfoRow("Nilai Investasi:", "Rp ${Formatter.formatNumber(report.invastmentValue)}"),
                                  const SizedBox(height: 8),
                                  _buildInfoRow("Periode:", "${_getMonthName(report.reportMonth)} ${report.reportYear}"),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is ReportError) {
                    return _buildErrorState();
                  }
                  return _buildEmptyState();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ReportBloc>().add(FetchReport());
        },
        backgroundColor: const Color(0xFF3A7BFD),
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildFilterDropdown(
      {required String label, required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.montserrat(
                  fontSize: 13, color: Colors.grey.shade600)),
          Icon(icon, color: Colors.grey.shade600),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, Color bg, IconData icon,
      {Color textColor = Colors.white, Color? borderColor}) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Text(text,
              style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: textColor)),
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return const Center(child: Text("❌ Error/Gagal mengambil data laporan"));
  }

  Widget _buildEmptyState() {
    return const Center(child: Text("Belum ada data laporan"));
  }

  String _getMonthName(int month) {
    const months = [
      "",
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
    return months[month];
  }
}

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
