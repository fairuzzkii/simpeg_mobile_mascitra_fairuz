import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'package:simpeg_mascitra_mobile/pages/checkoutPage/successSubmitOutScreen.dart';

class CameraCaptureOutScreen extends StatefulWidget {
  const CameraCaptureOutScreen({super.key});

  @override
  State<CameraCaptureOutScreen> createState() => _CameraCaptureOutScreenState();
}

class _CameraCaptureOutScreenState extends State<CameraCaptureOutScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;
  String? _errorMessage;
  CameraDevice _selectedCamera = CameraDevice.rear;

  Future<void> _takePicture() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final bool isAvailable = await _picker.supportsImageSource(
        ImageSource.camera,
      );

      if (!isAvailable) {
        setState(() {
          _errorMessage = 'Kamera tidak tersedia di perangkat ini';
          _isLoading = false;
        });
        return;
      }

      final XFile? photo = await _picker
          .pickImage(
            source: ImageSource.camera,
            imageQuality: 85,
            preferredCameraDevice: _selectedCamera,
            maxWidth: 1920,
            maxHeight: 1080,
          )
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () {
              throw TimeoutException('Timeout saat membuka kamera', const Duration(seconds: 30));
            },
          );

      if (photo != null) {
        final file = File(photo.path);
        setState(() {
          _imageFile = file;
          _isLoading = false;
          _errorMessage = null;
        });
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = null;
        });
      }
    } on PlatformException catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.message;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  void _switchCamera() {
    setState(() {
      _selectedCamera =
          _selectedCamera == CameraDevice.rear
              ? CameraDevice.front
              : CameraDevice.rear;
    });
  }

  void _retakePicture() {
    setState(() {
      _imageFile = null;
      _errorMessage = null;
    });
  }

  void _submitPhoto() {
    if (_imageFile != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const SuccessSubmitOutScreen(
            title: 'Absensi Pulang Telah Berhasil',
            subtitle: 'Selamat Beristirahat',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with Grey.png background - matching CheckIn/CheckOut design
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
                    SizedBox(width: 6),
                    Text(
                      'Jam Pulang',
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
          const SizedBox(height: 24),

          // Camera preview container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFC64304), width: 2),
                borderRadius: BorderRadius.circular(18),
                color: Color(0xFFF5F5F5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: _imageFile != null
                    ? Stack(
                        children: [
                          Image.file(
                            _imageFile!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: GestureDetector(
                              onTap: _retakePicture,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 64,
                                  color: Color(0xFF989898),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Ambil Foto untuk Absensi',
                                  style: TextStyle(
                                    color: Color(0xFF989898),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _selectedCamera == CameraDevice.rear
                                      ? 'Kamera Belakang'
                                      : 'Kamera Depan',
                                  style: TextStyle(
                                    color: Color(0xFFC64304),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: GestureDetector(
                              onTap: _switchCamera,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0xFFC64304),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.flip_camera_ios,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.error, color: Colors.red),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Error mengambil foto:',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 16),

          if (_imageFile == null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isLoading ? null : _takePicture,
                  icon: _isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Icon(Icons.camera_alt, color: Colors.white),
                  label: Text(
                    _isLoading ? 'Membuka Kamera...' : 'Ambil Foto',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isLoading ? Colors.grey : const Color(0xFFC64304),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                  ),
                ),
              ),
            ),

          if (_imageFile != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _retakePicture,
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      label: const Text(
                        'Ambil Ulang',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _submitPhoto,
                      icon: const Icon(Icons.check, color: Colors.white),
                      label: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC64304),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}