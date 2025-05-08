import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final _doctorController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _database = FirebaseDatabase.instance.ref();
  final _auth = FirebaseAuth.instance;

  Future<void> _bookAppointment() async {
    final user = _auth.currentUser;

    if (user != null) {
      final appointmentRef = _database.child("appointments").push();
      await appointmentRef.set({
        "userId": user.uid,
        "doctor": _doctorController.text.trim(),
        "date": _dateController.text.trim(),
        "time": _timeController.text.trim(),
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Appointment booked")));
      _doctorController.clear();
      _dateController.clear();
      _timeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Appointment")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _doctorController,
              decoration: InputDecoration(labelText: "Doctor Name"),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: "Date (e.g. 2025-05-10)"),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: "Time (e.g. 14:00)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _bookAppointment,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}