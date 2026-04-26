import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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
            _buildNavItem(Icons.home, 'home'.tr(), 0),
            _buildNavItem(Icons.location_on, 'address'.tr(), 1),
            _buildNavItem(Icons.add_circle_outline, 'add'.tr(), 2),
            _buildNavItem(Icons.person, 'profile'.tr(), 3),
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
              Expanded(
                child: Text(
                  'eco_tire'.tr(),
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: softBlack),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('welcome'.tr(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                const Text('محمد عبدالله', style: TextStyle(fontSize: 16, color: Colors.black54)),
                const SizedBox(height: 2),
                Text('citizen'.tr(), style: const TextStyle(fontSize: 14, color: Colors.black45)),
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
            child: Text(
              'sales_info'.tr(),
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: white),
            ),
          ),
          _buildInfoRow(
            icon: Icons.camera_alt,
            title: 'take_picture'.tr(),
            subtitle: 'upload_wheels_picture'.tr(),
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
            title: 'select_delivery_time'.tr(),
            subtitle: 'delivery_time_example'.tr(),
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
                child: Text(
                  'confirm_sale'.tr(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: white),
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
                  children: [
                    Text('company_location'.tr(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                    const SizedBox(height: 6),
                    Text('company_address'.tr(), style: const TextStyle(color: Colors.black54)),
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
                'ton'.tr(),
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
                'kilogram'.tr(),
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
              'warning_incomplete_info'.tr(),
              style: const TextStyle(color: Color(0xFF5E4B2B), fontSize: 14),
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
