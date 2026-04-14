import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isIndividual = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset(
              "assets/bg.jpg", // replace with your image
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay
          Container(color: Colors.black.withOpacity(0.2)),

          // Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Logo
                  Column(
                    children: [
                      Image.asset(
                        "assets/logo.png", // your logo
                        height: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Eco-Tire",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Card
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        // Toggle buttons
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.shade200,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() => isIndividual = true);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: isIndividual ? Colors.green : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "أفراد",
                                        style: TextStyle(color: isIndividual ? Colors.white : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() => isIndividual = false);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: !isIndividual ? Colors.green : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "شركة",
                                        style: TextStyle(color: !isIndividual ? Colors.white : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),

                        // Input fields
                        buildTextField("الاسم الكامل", Icons.person),
                        buildTextField("البريد الإلكتروني", Icons.email),
                        buildTextField("كلمة المرور", Icons.lock, obscure: true),
                        buildTextField("تأكيد كلمة المرور", Icons.lock, obscure: true),

                        SizedBox(height: 20),

                        // Button
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [Colors.green.shade700, Colors.green.shade400]),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            onPressed: () {},
                            child: Text("تسجيل الآن", style: TextStyle(fontSize: 16)),
                          ),
                        ),

                        SizedBox(height: 10),

                        // Footer
                        Text("هل لديك حساب بالفعل؟ تسجيل الدخول", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String hint, IconData icon, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
      ),
    );
  }
}
