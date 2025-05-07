// lib/main.dart

import 'package:flutter/material.dart';

void Page1() {
  runApp(const MyFirstFeatureApp());
}

class MyFirstFeatureApp extends StatelessWidget {
  const MyFirstFeatureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Feature',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyFirstFeaturePage(),
    );
  }
}

class MyFirstFeaturePage extends StatelessWidget {
  const MyFirstFeaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First Feature'),
      ),
      body: const Center(
        child: Text(
          '👋 Hello from your first feature!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
