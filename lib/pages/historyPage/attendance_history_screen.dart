import 'package:flutter/material.dart';
import 'package:simpeg_mascitra_mobile/pages/historyPage/pilih_tanggal_screen.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() =>
      _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  bool _showFilter = true;
  double _lastOffset = 0;

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _openDatePicker() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PilihTanggalScreen()),
    );
    if (result != null && result is Map) {
      setState(() {
        _startDate = result['startDate'] as DateTime?;
        _endDate = result['endDate'] as DateTime?;
      });
    }
  }

  String _getDateRangeText() {
    if (_startDate == null && _endDate == null) return 'No Data';
    if (_startDate != null && _endDate == null) {
      return '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}';
    }
    if (_startDate != null && _endDate != null) {
      return '${_startDate!.day}/${_startDate!.month}/${_startDate!.year} - ${_endDate!.day}/${_endDate!.month}/${_endDate!.year}';
    }
    return 'No Data';
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
                              'Riwayat Absensi',
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
                      _AttendanceCard(
                        date: '23 July 2025',
                        inTime: '07:29:53',
                        inLocation:
                            'Lat: -8.1857992\nLong: 113.6806793\nRM7J+M6Q, Kaliwates, Kecamatan Kaliwates, 68131, Indonesia',
                        outTime: '17:10:41',
                        outLocation:
                            'Lat: -8.1857992\nLong: 113.6806793\nRM7J+M6Q, Kaliwates, Kecamatan Kaliwates, 68131, Indonesia',
                      ),
                      const SizedBox(height: 16),
                      _AttendanceCard(
                        date: '22 July 2025',
                        inTime: '07:29:53',
                        inLocation:
                            'Lat: -8.1857992\nLong: 113.6806793\nRM7J+M6Q, Kaliwates, Kecamatan Kaliwates, 68131, Indonesia',
                        outTime: '17:10:41',
                        outLocation:
                            'Lat: -8.1857992\nLong: 113.6806793\nRM7J+M6Q, Kaliwates, Kecamatan Kaliwates, 68131, Indonesia',
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
                          'Filter Absensi',
                          style: TextStyle(
                            color: Color(0xFFC64304),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: _openDatePicker,
                          child: Row(
                            children: [
                              Container(
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Select Date',
                                          style: TextStyle(
                                            color: Color(0xFFC64304),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          _getDateRangeText(),
                                          style: const TextStyle(
                                            color: Color(0xFF989898),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFFC64304),
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Divider(height: 1, color: Color(0xFFF5F5F7)),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
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

class _AttendanceCard extends StatelessWidget {
  final String date;
  final String inTime;
  final String inLocation;
  final String outTime;
  final String outLocation;
  const _AttendanceCard({
    required this.date,
    required this.inTime,
    required this.inLocation,
    required this.outTime,
    required this.outLocation,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            inTime,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Jam Masuk',
                            style: TextStyle(color: Color(0xFF989898), fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            inLocation,
                            style: const TextStyle(
                              color: Color(0xFF989898),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            outTime,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Jam Pulang',
                            style: TextStyle(color: Color(0xFF989898), fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            outLocation,
                            style: const TextStyle(
                              color: Color(0xFF989898),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}