import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Fixed: Using GestureFlipCardController for the GestureFlipCard widget
  final controller = GestureFlipCardController();

  @override
  Widget build(BuildContext context) {
    const TextStyle cardTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: GestureFlipCard(
                animationDuration: const Duration(milliseconds: 400),
                axis: FlipAxis.horizontal,
                controller: controller,
                // Front Side
                frontWidget: Card(
                  elevation: 8,
                  color: const Color(0xFF1A1A2E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.help_outline, size: 50, color: Color(0xFF311B92)),
                          SizedBox(height: 20),
                          Text(
                            "What does 'StatelessWidget' mean in Flutter?",
                            textAlign: TextAlign.center,
                            style: cardTextStyle,
                          ),
                          SizedBox(height: 20),
                          Text("(Swipe or tap to flip)", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
                // Back Side
                backWidget: Card(
                  elevation: 8,
                  color: const Color(0xFF311B92),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle_outline, size: 50, color: Colors.green),
                          SizedBox(height: 20),
                          Text(
                            "A widget that does not require mutable state.",
                            textAlign: TextAlign.center,
                            style: cardTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Incorrect"), duration: Duration(milliseconds: 500)),
                    );
                  },
                  icon: const Icon(Icons.close, color: Colors.white),
                  label: const Text("Incorrect"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Correct!"), duration: Duration(milliseconds: 500)),
                    );
                  },
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text("Correct"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
