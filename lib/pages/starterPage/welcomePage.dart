import 'package:flutter/material.dart';
import 'package:simpeg_mascitra_mobile/pages/authPage/loginPage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
        child: Stack(
          children: [

            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFF8C42)
                  ],
                ),
              ),
            ),
                     
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height * 0.50,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.12), 
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D2D2D),
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Memantau peserta magang dengan\nmobilitas tinggi menjadi lebih mudah\ndengan aplikasi manajemen\ninformasi peserta magang berbasis\nmobile.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF8A8A8A),
                          height: 1.6,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
                     

            Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: MediaQuery.of(context).size.height * 0.8, 
              child: Image.asset(
                'assets/images/topographic_pattern.png',
                fit: BoxFit.cover,
              ),
            ),
            

            Positioned(
              bottom: 32,
              right: 32,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC64304),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}