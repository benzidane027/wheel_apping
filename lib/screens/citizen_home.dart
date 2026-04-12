import 'package:flutter/material.dart';

class CitizenHome extends StatelessWidget {
  const CitizenHome({super.key});

  Widget iconButton(IconData icon, String text) {
    return Column(
      children: [
        CircleAvatar(radius: 28, child: Icon(icon)),
        const SizedBox(height: 5),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ECO TIRE"), actions: const [Icon(Icons.notifications)]),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text("مرحبا"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconButton(Icons.camera_alt, "Photo"),
              iconButton(Icons.location_on, "Location"),
              iconButton(Icons.calendar_today, "Date"),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: () {}, child: const Text("Confirm Sale")),
        ],
      ),
    );
  }
}
