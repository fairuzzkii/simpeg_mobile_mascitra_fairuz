import 'package:flutter/material.dart';

class DataAkunPage extends StatefulWidget {
  const DataAkunPage({super.key});

  @override
  State<DataAkunPage> createState() => _DataAkunPageState();
}

class _DataAkunPageState extends State<DataAkunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header - sama dengan PengajuanCutiPage
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
                    SizedBox(width:0),
                    Text(
                      'Data Akun',
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
                  children: [
                    _buildDataItem(
                      icon: Icons.email_outlined,
                      label: 'Email',
                      value: 'fairuz@gmail.com',
                    ),
                    _buildDivider(),
                    _buildDataItem(
                      icon: Icons.badge_outlined,
                      label: 'NIP',
                      value: '123456789/1234567890',
                    ),
                    _buildDivider(),
                    _buildDataItem(
                      icon: Icons.person_outline,
                      label: 'Nama',
                      value: 'Fairuz Zaki',
                    ),
                    _buildDivider(),
                    _buildDataItem(
                      icon: Icons.phone_outlined,
                      label: 'Nomor Telepon',
                      value: '12345678910',
                    ),
                    _buildDivider(),
                    _buildDataItem(
                      icon: Icons.location_on_outlined,
                      label: 'Alamat',
                      value: 'Lorem ipsum dolor sit amet, consectetur.',
                    ),
                    _buildDivider(),
                    _buildDataItem(
                      icon: Icons.place_outlined,
                      label: 'Tempat Lahir',
                      value: 'Lorem ipsum dolor sit amet, consectetur.',
                    ),
                    _buildDivider(),
                    _buildDataItem(
                      icon: Icons.calendar_today_outlined,
                      label: 'Tanggal Lahir',
                      value: '02/09/2005',
                    ),
                    _buildDivider(),
                    _buildDataItem(
                      icon: Icons.people_outline,
                      label: 'Jenis Kelamin',
                      value: 'Laki-laki',
                      isLast: true,
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

  Widget _buildDataItem({
    required IconData icon,
    required String label,
    required String value,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFC64304).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Color(0xFFC64304),
              size: 20,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Color(0xFFC64304),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 1,
      height: 1,
    );
  }
}