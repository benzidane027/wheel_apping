import 'package:flutter/material.dart';

import '../theme.dart';
import 'login_screen.dart';

class CitizenHome extends StatefulWidget {
  const CitizenHome({super.key});

  @override
  State<CitizenHome> createState() => _CitizenHomeState();
}

class _CitizenHomeState extends State<CitizenHome> {
  int selectedNavIndex = 0;
  bool useTon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ecoWhite,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFEFF7F1), Color(0xFFFFFFFF)],
              ),
            ),
          ),
          Positioned(
            top: -80,
            left: -80,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(color: primaryGreen.withOpacity(0.16), shape: BoxShape.circle),
            ),
          ),
          Positioned(
            top: 40,
            right: -100,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(color: lightGreen.withOpacity(0.18), shape: BoxShape.circle),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginScreen()),
                          );
                        },
                        child: _buildCircleIconButton(Icons.arrow_back),
                      ),
                      _buildCircleIconButton(Icons.notifications),
                      _buildCircleIconButton(Icons.recycling),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeaderSection(),
                        const SizedBox(height: 18),
                        _buildInfoCard(),
                        const SizedBox(height: 18),
                        _buildWarningBanner(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 15, offset: const Offset(0, -3)),
          ],
        ),
        padding: const EdgeInsets.only(top: 12, bottom: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'الرئيسية', 0),
            _buildNavItem(Icons.location_on, 'العنوان', 1),
            _buildNavItem(Icons.add_circle_outline, 'إضافة', 2),
            _buildNavItem(Icons.person, 'الملف الشخصي', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleIconButton(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10)],
      ),
      child: Icon(icon, size: 22, color: primaryGreen),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('asset/img.png', width: 44),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Eco-Tire',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: softBlack),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text('مرحبا بكم', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('محمد عبدالله', style: TextStyle(fontSize: 16, color: Colors.black54)),
                SizedBox(height: 2),
                Text('مواطن', style: TextStyle(fontSize: 14, color: Colors.black45)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 22, offset: const Offset(0, 12))],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            ),
            child: const Text(
              'معلومات البيع',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: white),
            ),
          ),
          _buildInfoRow(
            icon: Icons.camera_alt,
            title: 'التقاط صورة',
            subtitle: 'قم برفع صورة العجلات',
            trailing: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: primaryGreen.withOpacity(0.12), shape: BoxShape.circle),
              child: const Icon(Icons.check, color: primaryGreen, size: 20),
            ),
          ),
          const Divider(height: 1, indent: 18, endIndent: 18),
          _buildLocationRow(),
          const Divider(height: 1, indent: 18, endIndent: 18),
          _buildInfoRow(
            icon: Icons.calendar_today,
            title: 'تحديد وقت التسليم',
            subtitle: 'الثلاثاء، 30 أبريل، 2024',
            trailing: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: primaryGreen.withOpacity(0.12), shape: BoxShape.circle),
              child: const Icon(Icons.calendar_today, color: primaryGreen, size: 20),
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                ),
                child: const Text(
                  'تأكيد البيع',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildLocationRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: primaryGreen.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.location_on, color: primaryGreen),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('موقع الشركة', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                    SizedBox(height: 6),
                    Text('Eco-Tire Company, 12 شارع الصناعة 12', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              _buildUnitSwitcher(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUnitSwitcher() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFF3F6F3), borderRadius: BorderRadius.circular(34)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() => useTon = true),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: useTon ? primaryGreen : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'طن',
                style: TextStyle(color: useTon ? white : softBlack, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => useTon = false),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: !useTon ? primaryGreen : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'كيلوغرام',
                style: TextStyle(color: !useTon ? white : softBlack, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: primaryGreen.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: primaryGreen),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                const SizedBox(height: 6),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  Widget _buildWarningBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5EB),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFF5D1A7)),
      ),
      child: Row(
        children: const [
          Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
          SizedBox(width: 14),
          Expanded(
            child: Text(
              'يجب أكمال المعلومات التالية: تكمل مفقود • تحدد موعد التسليم',
              style: TextStyle(color: Color(0xFF5E4B2B), fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = selectedNavIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedNavIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? primaryGreen : Colors.black45, size: 26),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 12, color: isSelected ? primaryGreen : Colors.black45)),
        ],
      ),
    );
  }
}
