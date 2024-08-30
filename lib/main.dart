import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(EventBookingApp());
}

class EventBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Booking',
      theme: ThemeData(
        primaryColor: Color(0xFF8A2BE2),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF5F9EA0),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
