import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'home.dart'; // Ensure HomePage is defined and imported
import 'user.dart'; // Import UserPage here

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({super.key});

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();
  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2023, 10, 28): ['Meeting with client', 'Prepare presentation'],
    DateTime.utc(2023, 10, 29): ['Team review', 'Update project files'],
    DateTime.utc(2023, 11, 1): ['Design finalization', 'Submit report'],
  };

  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  int _selectedIndex = 1; // 1 for Upcoming

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const UserPage()), // Navigate to UserPage
      );
    }

    setState(() {
      _selectedIndex = index; // Set selected index after navigation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Upcoming Tasks',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Calendar Widget
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _selectedDate,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDate = selectedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Events List for Selected Day
          Expanded(
            child: _buildEventsList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }

  Widget _buildEventsList() {
    List<String> selectedEvents = _getEventsForDay(_selectedDate);

    if (selectedEvents.isEmpty) {
      return const Center(
        child: Text(
          'No tasks scheduled for this day.',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: selectedEvents.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.red[100],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: Text(
              selectedEvents[index],
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Scheduled at ${DateFormat('yMMMMd').format(_selectedDate)}',
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        );
      },
    );
  }
}
