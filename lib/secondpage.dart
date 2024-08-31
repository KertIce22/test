import 'package:flutter/material.dart';
import 'package:test/define.dart';
import 'package:test/emphathize.dart';
import 'package:test/ideate.dart';
import 'package:test/prototype.dart';
import 'package:test/test.dart';
import 'package:test/devpage.dart'; // Import your DevPage

class Secondpage extends StatelessWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mainbg1.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0)
                      .copyWith(top: 100.0), // Adjusted top padding
                  child: Text(
                    'FIVE MODES',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: const Color.fromARGB(255, 240, 240, 240),
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 65.0), // Space between text and list
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 85.0), // Adjust top padding if needed
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      itemCount: 5, // Number of items
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return _buildCard(
                              gradientColors: [Colors.blue, Colors.blueAccent],
                              text: 'EMPATHIZE',
                              imageAsset: 'assets/images/bg.png', // Specify the image asset
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Emphathize()),
                                );
                              },
                            );
                          case 1:
                            return _buildCard(
                              gradientColors: [Colors.green, Colors.greenAccent],
                              text: 'DEFINE',
                              imageAsset: 'assets/images/def.png', // Specify the image asset
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Define()),
                                );
                              },
                            );
                          case 2:
                            return _buildCard(
                              gradientColors: [Colors.orange, Colors.deepOrangeAccent],
                              text: 'IDEATE',
                              imageAsset: 'assets/images/idea.png', // Specify the image asset
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Ideate()),
                                );
                              },
                            );
                          case 3:
                            return _buildCard(
                              gradientColors: [Colors.red, Colors.redAccent],
                              text: 'PROTOTYPE',
                              imageAsset: 'assets/images/pr.png', // Specify the image asset
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Prototype()),
                                );
                              },
                            );
                          case 4:
                            return _buildCard(
                              gradientColors: [Colors.purple, Colors.purpleAccent],
                              text: 'TEST',
                              imageAsset: 'assets/images/test.png', // Specify the image asset
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Test()),
                                );
                              },
                            );
                          default:
                            return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20.0, // Distance from the top
            right: 20.0, // Distance from the right
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DevPage()), // Navigate to DevPage
                );
              },
              child: Icon(Icons.developer_mode, size: 30.0),
              backgroundColor: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required List<Color> gradientColors,
    required String text,
    required String imageAsset, // Add image asset parameter
    void Function()? onTap,
    double cardHeight = 100.0, // Adjusted card height for button style
    double borderRadius = 12.0,
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
  }) {
    return Card(
      elevation: 5.0, // Reduced elevation for button style
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0), // Reduced margin for button style
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: cardHeight,
          padding: padding,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), // Optional overlay for readability
                BlendMode.darken, // Optional overlay mode
              ),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
