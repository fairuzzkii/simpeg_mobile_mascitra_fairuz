import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class RiwayatKegiatanHarianPage extends StatefulWidget {
  const RiwayatKegiatanHarianPage({super.key});

  @override
  State<RiwayatKegiatanHarianPage> createState() => _RiwayatKegiatanHarianPageState();
}

class _RiwayatKegiatanHarianPageState extends State<RiwayatKegiatanHarianPage> {
  bool _showFilter = true;
  double _lastOffset = 0;
  
  DateTime? _tanggalTerpilih;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _tempSelectedDate;

  void _showDatePickerDialog() {
    setState(() {
      _tempSelectedDate = _tanggalTerpilih;
    });

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFC64304),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Pilih Tanggal',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC64304),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TableCalendar(
                        focusedDay: DateTime.now(),
                        firstDay: DateTime(2000),
                        lastDay: DateTime(2100),
                        calendarFormat: _calendarFormat,
                        selectedDayPredicate: (day) {
                          return isSameDay(_tempSelectedDate, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setDialogState(() {
                            _tempSelectedDate = selectedDay;
                          });
                        },
                        onFormatChanged: (format) {
                          setDialogState(() {
                            _calendarFormat = format;
                          });
                        },
                        calendarStyle: CalendarStyle(
                          outsideDaysVisible: false,
                          weekendTextStyle: const TextStyle(color: Colors.black),
                          holidayTextStyle: const TextStyle(color: Colors.black),
                          defaultTextStyle: const TextStyle(color: Colors.black),
                          todayDecoration: BoxDecoration(
                            color: const Color(0xFFC64304).withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: const BoxDecoration(
                            color: Color(0xFFC64304),
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle: const TextStyle(color: Colors.white),
                          todayTextStyle: const TextStyle(color: Colors.white),
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          leftChevronIcon: const Icon(
                            Icons.chevron_left,
                            color: Color(0xFFC64304),
                          ),
                          rightChevronIcon: const Icon(
                            Icons.chevron_right,
                            color: Color(0xFFC64304),
                          ),
                          titleTextStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          weekendStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (_tempSelectedDate != null)
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Tanggal Terpilih: ${_tempSelectedDate!.day}/${_tempSelectedDate!.month}/${_tempSelectedDate!.year}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                setDialogState(() {
                                  _tempSelectedDate = null;
                                });
                              },
                              child: const Text(
                                "Reset",
                                style: TextStyle(color: Color(0xFFC64304)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _tanggalTerpilih = _tempSelectedDate;
                                });
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFC64304),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Pilih Tanggal",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  String _getDateText() {
    if (_tanggalTerpilih == null) return 'Tidak Ada Data';
    return '${_tanggalTerpilih!.day}/${_tanggalTerpilih!.month}/${_tanggalTerpilih!.year}';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Container(
                  width: screenWidth,
                  height: 110,
                  color: const Color(0xFFC64304),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/Grey.png',
                        fit: BoxFit.cover,
                        width: screenWidth,
                        height: 110,
                      ),
                      Positioned(
                        left: 16,
                        top: 48,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Riwayat Kegiatan Harian',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.axis == Axis.vertical) {
                      if (notification is ScrollUpdateNotification) {
                        if (notification.metrics.pixels > _lastOffset) {
                          // Scroll ke bawah
                          if (_showFilter) {
                            setState(() => _showFilter = false);
                          }
                        } else if (notification.metrics.pixels < _lastOffset) {
                          // Scroll ke atas
                          if (!_showFilter) {
                            setState(() => _showFilter = true);
                          }
                        }
                        _lastOffset = notification.metrics.pixels;
                      }
                    }
                    return false;
                  },
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 200),
                    children: [
                      _KegiatanCard(
                        date: '23 July 2025',
                        deskripsi: 'Lorem ipsum dolor sit amet',
                        target: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod felis vel sapien tristique, vel venenatis sapien lacinia. Vestibulum et egestas urna. Mauris sed augue luctus, interdum nisl in, lobortis nulla.',
                        realisasi: 'Lorem ipsum dolor sit amet',
                      ),
                      const SizedBox(height: 16),
                      _KegiatanCard(
                        date: '22 July 2025',
                        deskripsi: 'Lorem ipsum dolor sit amet',
                        target: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod felis vel sapien tristique, vel venenatis sapien lacinia. Vestibulum et egestas urna. Mauris sed augue luctus, interdum nisl in, lobortis nulla.',
                        realisasi: 'Lorem ipsum dolor sit amet',
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Animated filter
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedSlide(
              offset: _showFilter ? Offset(0, 0) : Offset(0, 1),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: SafeArea(
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 12,
                          offset: const Offset(0, -4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Filter Kegiatan',
                          style: TextStyle(
                            color: Color(0xFFC64304),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Single Date Picker
                        GestureDetector(
                          onTap: _showDatePickerDialog,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  color: Color(0xFFC64304),
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Pilih Tanggal',
                                        style: TextStyle(
                                          color: Color(0xFFC64304),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        _getDateText(),
                                        style: const TextStyle(
                                          color: Color(0xFF989898),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFC64304),
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        Divider(height: 1, color: Color(0xFFF5F5F7)),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Logic untuk filter data berdasarkan tanggal
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC64304),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Cari',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KegiatanCard extends StatelessWidget {
  final String date;
  final String deskripsi;
  final String target;
  final String realisasi;
  
  const _KegiatanCard({
    required this.date,
    required this.deskripsi,
    required this.target,
    required this.realisasi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFC64304),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              date,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('Deskripsi Kegiatan', deskripsi),
                const Divider(height: 16),
                _buildDetailRow('Target Kegiatan', target),
                const Divider(height: 16),
                _buildDetailRow('Realisasi Kegiatan', realisasi),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF989898),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}