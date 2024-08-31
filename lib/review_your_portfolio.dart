import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class ReviewPortfolio extends StatelessWidget {
  final String lessonTitleFront;
  final String lessonContentFront;
  final String lessonTitleBack;
  final String lessonContentBack;
  final String? backgroundImage;
  final String? lessonImageBack;
  final String? lessonImageFront;

  const ReviewPortfolio({
    Key? key,
    required this.lessonTitleFront,
    required this.lessonContentFront,
    required this.lessonTitleBack,
    required this.lessonContentBack,
    this.backgroundImage,
    this.lessonImageBack,
    this.lessonImageFront,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (backgroundImage != null)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: _buildPage(
                      title: lessonTitleFront,
                      content: lessonContentFront,
                      image: lessonImageFront,
                    ),
                    back: _buildPage(
                      title: lessonTitleBack,
                      content: lessonContentBack,
                      image: lessonImageBack,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String content,
    String? image,
  }) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
              spreadRadius: 5.0,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  content,
                  textAlign: TextAlign.justify, // This justifies the text
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
