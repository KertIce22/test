import 'package:flutter/material.dart';
import 'package:test/define.dart';
import 'package:test/emphathize.dart';
import 'package:test/ideate.dart';
import 'package:test/prototype.dart';
import 'package:test/test.dart';
import 'package:test/devpage.dart'; // Import your DevPage
import 'package:test/main.dart'; // Import your MyApp screen

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
                      .copyWith(top: 40.0), // Adjusted top padding
                  child: Text(
                    'FIVE MODES',
                    style: TextStyle(
                      fontSize: 45.0,
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0), // Adjust horizontal padding
                      itemCount: 5, // Number of items
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return _buildCard(
                              gradientColors: [Colors.blue, Colors.blueAccent],
                              text: 'EMPATHIZE',
                              imageAsset: 'assets/images/bg.png',
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
                              gradientColors: [
                                Colors.green,
                                Colors.greenAccent
                              ],
                              text: 'DEFINE',
                              imageAsset: 'assets/images/def.png',
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
                              gradientColors: [
                                Colors.orange,
                                Colors.deepOrangeAccent
                              ],
                              text: 'IDEATE',
                              imageAsset: 'assets/images/idea.png',
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
                              imageAsset: 'assets/images/pr.png',
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
                              gradientColors: [
                                Colors.purple,
                                Colors.purpleAccent
                              ],
                              text: 'TEST',
                              imageAsset: 'assets/images/test.png',
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
            left: 10.0, // Distance from the left
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(), // Navigate to MyApp
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight, // Align icon to the bottom right
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 25.0), // Add padding to the right
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DevPage(), // Navigate to DevPage
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, // Horizontal padding inside the button
                        vertical: 4.0, // Vertical padding inside the button
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 0, 219, 128), // Start color
                            Color.fromARGB(255, 0, 176, 94), // End color
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(
                            20.0), // Reduced border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 4), // Shadow offset
                            blurRadius: 8.0, // Shadow blur radius
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.info_sharp,
                            size: 30.0, // Icon size
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0), // Extra space at the bottom
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard({
    required List<Color> gradientColors,
    required String text,
    required String imageAsset, // Add image asset parameter
    void Function()? onTap,
    double cardHeight = 87.0, // Smaller card height
    double borderRadius = 12.0,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
        horizontal: 16.0, vertical: 8.0), // Adjusted padding
  }) {
    return Card(
      elevation: 3.0, // Reduced elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      margin:
          const EdgeInsets.symmetric(vertical: 6.0), // Smaller vertical margin
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
                Colors.black
                    .withOpacity(0.3), // Optional overlay for readability
                BlendMode.darken, // Optional overlay mode
              ),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
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
