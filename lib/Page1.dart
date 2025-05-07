import 'package:flutter/material.dart';

void main() => runApp(HealthlyApp());

class HealthlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HealthlyScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HealthlyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Top Logo Image (replace '' with your asset path)
            Image.asset(
              '', // ← add your image path here (e.g., 'assets/images/healthly_logo.png')
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 50),
            
            // Placeholder media box
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.black),
              ),
              child: CustomPaint(
                painter: CrossPainter(),
              ),
            ),

            const Spacer(),

            // Play button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class CrossPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
