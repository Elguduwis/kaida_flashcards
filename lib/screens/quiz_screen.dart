import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Controller to programmatically flip the card if needed
  final controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    // Define the style for the card content (Question/Answer text)
    const TextStyle cardTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
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
            // The Flashcard with Gesture Flip
            Expanded(
              child: FlipCard(
                rotateSide: RotateSide.bottom, // Define flip direction
                onTapFlipping: true, // Flip on tap
                axis: FlipAxis.horizontal,
                controller: controller,
                // Front Side (Question)
                frontWidget: Card(
                  elevation: 8,
                  color: const Color(0xFF1A1A2E), // Slightly lighter than background
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
                          Spacer(),
                          Text("(Tap to flip)", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
                // Back Side (Answer)
                backWidget: Card(
                  elevation: 8,
                  color: const Color(0xFF311B92), // Deep Purple for Answer
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
                            "A widget that does not require mutable state and remains unchanged during its lifetime.",
                            textAlign: TextAlign.center,
                            style: cardTextStyle,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Correct / Incorrect Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Incorrect Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Placeholder for logic (e.g., mark as wrong, next card)
                    print("Incorrect pressed");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Marked as Incorrect"), duration: Duration(seconds: 1)),
                    );
                  },
                  icon: const Icon(Icons.close, color: Colors.white),
                  label: const Text("Incorrect"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                // Correct Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Placeholder for logic
                    print("Correct pressed");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Marked as Correct"), duration: Duration(seconds: 1)),
                    );
                  },
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text("Correct"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
