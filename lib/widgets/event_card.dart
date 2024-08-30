import 'package:flutter/material.dart';
import '../screens/event_details_screen.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String location;
  final String date;
  final String description;
  final double ticketPrice;

  EventCard({
    required this.eventName,
    required this.location,
    required this.date,
    required this.description,
    required this.ticketPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(eventName),
        subtitle: Text('$location - $date'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventDetailsScreen(
                eventName: eventName,
                location: location,
                date: date,
                description: description,
                ticketPrice: ticketPrice,
              ),
            ),
          );
        },
      ),
    );
  }
}
