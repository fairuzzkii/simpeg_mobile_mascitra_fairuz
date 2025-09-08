import 'package:flutter/material.dart';
import 'package:simpeg_mascitra_mobile/pages/cutiPage/riwayatCutiPage.dart';
import 'package:simpeg_mascitra_mobile/pages/historyPage/attendance_history_screen.dart';
import 'package:simpeg_mascitra_mobile/pages/kegiatanHarianPage/kegiatanHarianPage.dart';
import 'package:simpeg_mascitra_mobile/pages/notificationPage/notificationPage.dart';
import 'package:simpeg_mascitra_mobile/pages/penilaianPage/penilaianPage.dart';
import 'package:simpeg_mascitra_mobile/pages/checkinPage/checkinScreen.dart';
import 'package:simpeg_mascitra_mobile/pages/checkoutPage/checkoutScreen.dart';
import '../navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDate = 'MON\n4';
  bool isAbsent = false;

  final List<Map<String, dynamic>> features = [
    {'title': 'Jam Masuk', 'icon': 'assets/icon/clock.png', 'color': Color(0xFFC64304)},
    {'title': 'Jam Pulang', 'icon': 'assets/icon/watch.png', 'color': Color(0xFFC64304)},
    {'title': 'Cuti', 'icon': 'assets/icon/chat.png', 'color': Color(0xFFC64304)},
    {
      'title': 'Kegiatan Harian',
      'icon': 'assets/icon/presentationboard.png',
      'color': Color(0xFFC64304),
    },
    {
      'title': 'Riwayat Absensi',
      'icon': 'assets/icon/clipboard.png',
      'color': Color(0xFFC64304),
    },
    {'title': 'Penilaian', 'icon': 'assets/icon/robot.png', 'color': Color(0xFFC64304)},
  ];

  final List<Map<String, String>> weekDays = [
    {'day': 'MON', 'date': '4'},
    {'day': 'Tue', 'date': '5'},
    {'day': 'Wed', 'date': '6'},
    {'day': 'Thu', 'date': '7'},
    {'day': 'Fri', 'date': '8'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Container(
            height: MediaQuery.of(context).padding.top + 130, 
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Greybig.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Selamat Pagi',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          'Fairuz Zaki',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 0),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 0,
                  bottom: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Feature grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemCount: features.length,
                      itemBuilder: (context, index) {
                        final feature = features[index];
                        return GestureDetector(
                          onTap: () {
                            // Handle feature tap
                            switch (feature['title']) {
                              case 'Jam Masuk':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CheckInScreen(),
                                  ),
                                );
                                break;
                              case 'Jam Pulang':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CheckOutScreen(),
                                  ),
                                );
                                break;
                              case 'Cuti':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RiwayatCutiPage(),
                                  ),
                                );
                                break;
                              case 'Riwayat Absensi':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AttendanceHistoryScreen(),
                                  ),
                                );
                                break;
                              case 'Penilaian':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PenilaianPage(),
                                  ),
                                );
                                break;
                              case 'Kegiatan Harian':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const KegiatanHarianPage(),
                                  ),
                                );
                                break;
                              default:
                                // Handle other features or show a placeholder
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${feature['title']} belum tersedia'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                break;
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: feature['color'].withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    feature['icon'],
                                    width: 20,
                                    height: 20,
                                    color: feature['color'], // Apply color tint
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  feature['title'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF2D2D2D),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    // Attendance section
                    const Text(
                      'Tanggal Absensi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D2D2D),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Week calendar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: weekDays.map((day) {
                        final isSelected =
                            selectedDate == '${day['day']}\n${day['date']}';
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = '${day['day']}\n${day['date']}';
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 80,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFC64304)
                                  : Colors.grey[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  day['day']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF6B6B6B),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  day['date']!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF2D2D2D),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),
                    // Attendance status
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFFFE0B2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Status',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF6B6B6B),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  isAbsent ? 'Sudah Absen' : 'Belum Absen',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2D2D2D),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isAbsent = !isAbsent;
                              });
                            },
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFFC64304),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.fingerprint,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Notifications section
                    const Text(
                      'Pemberitahuan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D2D2D),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Notification card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC64304),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFC64304).withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Lorem ipsum dolor sit amet',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Lorem ipsum dolor sit amet consectetur adipiscing elit. Duis mattis molestie tristique. Ut euismod diam non lorem facilisis.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                    height: 1.4,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30), // Space for bottom navigation
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}