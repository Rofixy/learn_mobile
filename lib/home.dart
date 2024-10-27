import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'upcoming.dart'; // Import the UpcomingPage
import 'user.dart'; // Make sure the user.dart file is in the correct location or adjust the path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.red,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different pages based on selected index
    switch (index) {
      case 0:
        // Logic for Today
        break;
      case 1:
        // Navigate to UpcomingPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UpcomingPage()),
        );
        break;
      case 2:
        // Navigate to UserPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'To do list',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/Rofixy/image/refs/heads/main/check-list_8144374.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'What do you need to get done today?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'By default, tasks added here will be due today. Tap + to add a task.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTodoPage()),
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add, color: Colors.white),
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
            icon: Icon(Icons.event_note), // Icon for Upcoming
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Icon for User
            label: 'User',
          ),
        ],
      ),
    );
  }
}

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Add To-Do',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onTap: _pickDate,
              readOnly: true,
              decoration: InputDecoration(
                labelText: _selectedDate == null
                    ? 'Deadline (Optional)'
                    : DateFormat.yMd().format(_selectedDate!),
                labelStyle: const TextStyle(color: Colors.black),
                border: const OutlineInputBorder(),
                suffixIcon:
                    const Icon(Icons.calendar_today, color: Colors.white70),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Code to add the todo goes here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('ADD TODO'),
            ),
          ],
        ),
      ),
    );
  }
}
