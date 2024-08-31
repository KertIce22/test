import 'package:flutter/material.dart';

class def2 extends StatelessWidget {
  final String lessonTitle;
  final String lessonContent;
  final String? backgroundImage; // Added background image property

  const def2({
    Key? key,
    required this.lessonTitle,
    required this.lessonContent,
    this.backgroundImage, // Optional background image parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: backgroundImage != null
              ? DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                ],
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                          0.6), // Background color with transparency
                      borderRadius:
                          BorderRadius.circular(8.0), // Rounded corners
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            lessonTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              color:
                                  Colors.white, // Change color for visibility
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          lessonContent,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white, // Change color for visibility
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
