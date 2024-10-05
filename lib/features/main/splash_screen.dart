import 'package:flutter/material.dart';
import '../../core/constants/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Pindah ke main menu setelah 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      // Pindah ke MainMenuScreen menggunakan nama route
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/main');
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(96),
        child: Center(
          child: Image.asset(Images.banking), // Gambar logo splash
        ),
      ),
    );
  }
}
