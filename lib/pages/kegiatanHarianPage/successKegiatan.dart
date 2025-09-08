import 'package:flutter/material.dart';
import 'package:simpeg_mascitra_mobile/pages/homePage/homePage.dart';

class KegiatanBerhasilPage extends StatefulWidget {
  const KegiatanBerhasilPage({super.key});

  @override
  State<KegiatanBerhasilPage> createState() => _KegiatanBerhasilPageState();
}

class _KegiatanBerhasilPageState extends State<KegiatanBerhasilPage> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
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
              SizedBox(height: 40),
              Text(
                "The Dailies Activities Has Been Sent",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}