import 'package:flutter/material.dart';
import 'booking_confirmation_screen.dart';

class EventDetailsScreen extends StatelessWidget {
  final String eventName;
  final String location;
  final String date;
  final String description;
  final double ticketPrice;

  EventDetailsScreen({
    required this.eventName,
    required this.location,
    required this.date,
    required this.description,
    required this.ticketPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(eventName, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('$location - $date'),
            SizedBox(height: 20),
            Text(description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Ticket Price: \Rs.${ticketPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8A2BE2),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingConfirmationScreen(),
                  ),
                );
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
