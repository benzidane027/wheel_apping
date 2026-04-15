import 'package:flutter/material.dart';

import '../theme.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  Widget _buildLanguageButton(String text) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: primaryGreen,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 6,
          shadowColor: primaryGreen.withOpacity(0.35),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7FBF7), Color(0xFFEAF3E8)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 26,
                          offset: const Offset(0, 14),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: primaryGreen.withOpacity(0.2),
                                blurRadius: 22,
                                offset: const Offset(0, 10),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset('asset/img.png', width: 64),
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'Eco-Tire',
                          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: softBlack),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'نشتري العجلات... وأنت تربح',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 22,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildLanguageButton('العربية'),
                        const SizedBox(height: 14),
                        _buildLanguageButton('English'),
                        const SizedBox(height: 14),
                        _buildLanguageButton('Français'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
