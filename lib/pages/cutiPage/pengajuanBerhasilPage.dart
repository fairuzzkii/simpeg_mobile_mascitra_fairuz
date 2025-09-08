import 'package:flutter/material.dart';
import 'package:simpeg_mascitra_mobile/pages/homePage/homePage.dart';

class PengajuanBerhasilPage extends StatefulWidget {
  const PengajuanBerhasilPage({super.key});

  @override
  State<PengajuanBerhasilPage> createState() => _PengajuanBerhasilPageState();
}

class _PengajuanBerhasilPageState extends State<PengajuanBerhasilPage> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));

    // Cek apakah widget masih mounted sebelum melanjutkan
    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFFC64304),
                radius: MediaQuery.of(context).size.height * 0.12,
                child: Image.asset(
                  "assets/images/checklist.png",
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Pengajuan Cuti Telah Terkirim",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
