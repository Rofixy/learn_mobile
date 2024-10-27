import 'package:flutter/material.dart';
import 'home.dart'; // Adjust the path as necessary
import 'upcoming.dart'; // Import UpcomingPage
import 'main.dart'; // Import MyHomePage here

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi ke halaman utama saat item "Today" atau "Upcoming" di-tap
    if (index == 0) {
      // Navigate to HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 1) {
      // Navigate to UpcomingPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UpcomingPage()),
      );
    }
    // No need to navigate on User page since you're already there
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'User',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/Rofixy/image/refs/heads/main/check-list_8144374.png', // Replace with your image asset path
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Username',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            const Text(
              'Rofiq Hidayat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            const Text(
              'rofiqhidayat031@gmail.com',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            TextButton(
              onPressed: () {
                // Add functionality to change password
              },
              child: const Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to MyHomePage on log out
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage()), // Ensure MyHomePage is defined and imported
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'LOG OUT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
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
}
