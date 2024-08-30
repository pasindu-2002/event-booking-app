import 'package:flutter/material.dart';
import '../widgets/event_card.dart';
import '../models/event.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  String selectedLocation = 'All';
  String selectedDate = 'All';
  String searchQuery = '';

  final List<Event> allEvents = [
    Event(
      name: 'Concert in the Park',
      category: 'Music',
      location: 'Central Park',
      date: '2024-09-01',
      description: 'An outdoor concert with live music.',
      ticketPrice: 2000.00,
    ),
    Event(
      name: 'Tech Conference 2024',
      category: 'Technology',
      location: 'Convention Center',
      date: '2024-09-10',
      description: 'A gathering of tech enthusiasts and professionals.',
      ticketPrice: 1500.00,
    ),
    Event(
      name: 'Art Exhibition',
      category: 'Art',
      location: 'City Gallery',
      date: '2024-09-15',
      description: 'An exhibition of modern art.',
      ticketPrice: 500.00,
    ),
    // Add more events...
  ];

  List<Event> filteredEvents = [];

  @override
  void initState() {
    super.initState();
    filteredEvents = allEvents; // Initially show all events
  }

  void filterEvents() {
    setState(() {
      filteredEvents = allEvents.where((event) {
        final matchesCategory =
            selectedCategory == 'All' || event.category == selectedCategory;
        final matchesLocation =
            selectedLocation == 'All' || event.location == selectedLocation;
        final matchesDate = selectedDate == 'All' || event.date == selectedDate;
        final matchesSearchQuery =
            event.name.toLowerCase().contains(searchQuery.toLowerCase());
        return matchesCategory &&
            matchesLocation &&
            matchesDate &&
            matchesSearchQuery;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8A2BE2), // Applying brand color
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Upcoming Events',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Search Bar
            Container(
              width: 200,
              child: TextField(
                onChanged: (String query) {
                  setState(() {
                    searchQuery = query;
                    filterEvents();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Optionally handle icon press
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Filters Row
          Container(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Category Filter
                  Container(
                    width: 120,
                    child: DropdownButtonFormField<String>(
                      value: selectedCategory,
                      decoration: InputDecoration(
                        labelText: 'Category',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                          filterEvents();
                        });
                      },
                      items: <String>[
                        'All',
                        'Music',
                        'Technology',
                        'Art',
                        // Add more categories as needed
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Location Filter
                  Container(
                    width: 120,
                    child: DropdownButtonFormField<String>(
                      value: selectedLocation,
                      decoration: InputDecoration(
                        labelText: 'Location',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLocation = newValue!;
                          filterEvents();
                        });
                      },
                      items: <String>[
                        'All',
                        'Central Park',
                        'Convention Center',
                        'City Gallery',
                        // Add more locations as needed
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Date Filter
                  Container(
                    width: 120,
                    child: DropdownButtonFormField<String>(
                      value: selectedDate,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDate = newValue!;
                          filterEvents();
                        });
                      },
                      items: <String>[
                        'All',
                        '2024-09-01',
                        '2024-09-10',
                        '2024-09-15',
                        // Add more dates as needed
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Event List
          Expanded(
            child: ListView.builder(
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                final event = filteredEvents[index];
                return EventCard(
                  eventName: event.name,
                  location: event.location,
                  date: event.date,
                  description: event.description,
                  ticketPrice: event.ticketPrice,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
