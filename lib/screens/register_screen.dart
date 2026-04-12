import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            TextField(decoration: InputDecoration(labelText: "Full Name")),
            TextField(decoration: InputDecoration(labelText: "Email/Phone")),
            TextField(decoration: InputDecoration(labelText: "Password")),
            TextField(decoration: InputDecoration(labelText: "Confirm Password")),
          ],
        ),
      ),
    );
  }
}
