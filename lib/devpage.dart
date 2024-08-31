import 'package:flutter/material.dart';
import 'package:test/secondpage.dart';

void main() {
  runApp(const DevPage());
}

class DevPage extends StatelessWidget {
  const DevPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DeveloperPage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg8.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Secondpage()),
                      );
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'Our Team',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: const [
                  DeveloperTile(
                    name: 'Kekert Ice Roque',
                    role: 'Backend Developer',
                    imageUrl: 'assets/images/alice.png',
                  ),
                  DeveloperTile(
                    name: 'Christian Keith S. Abacahin',
                    role: 'Frontend Developer/ UI/UX',
                    imageUrl: 'assets/images/bob.png',
                  ),
                  DeveloperTile(
                    name: 'Mirah Mea Aguilar',
                    role: 'Frontend Developer/ UI/UX',
                    imageUrl: 'assets/images/carol.png',
                  ),
                  DeveloperTile(
                    name: 'Joemari Obrial',
                    role: 'Frontend Developer/ UI/UX',
                    imageUrl: 'assets/images/david.png',
                  ),
                  DeveloperTile(
                    name: 'Joshua Calma',
                    role: 'Frontend Developer/ UI/UX',
                    imageUrl: 'assets/images/eva.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeveloperTile extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const DeveloperTile({
    Key? key,
    required this.name,
    required this.role,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8), // White card background with some transparency
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Rounded corners
      ),
      margin: const EdgeInsets.only(bottom: 16.0), // Margin between cards
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Inner padding
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 40.0, // Circular image
            ),
            const SizedBox(height: 16.0), // Space between image and text
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              role,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 16.0), // Space before social icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.linked_camera),
                  onPressed: () {
                    // Action for LinkedIn
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.link),
                  onPressed: () {
                    // Action for GitHub
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.mail),
                  onPressed: () {
                    // Action for email
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
