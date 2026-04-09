
import 'package:flutter/material.dart';



class QuizScreen extends StatelessWidget {

  final String category;

  const QuizScreen({super.key, required this.category});



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(category),

      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Icon(Icons.school, size: 100, color: Color(0xFF311B92)),

            const SizedBox(height: 20),

            Text(

              "Welcome to $category Quiz",

              style: const TextStyle(fontSize: 22, color: Colors.white),

            ),

            const SizedBox(height: 10),

            const Text(

              "Flashcards coming soon...",

              style: TextStyle(color: Colors.grey),

            ),

            const SizedBox(height: 30),

            ElevatedButton(

              style: ElevatedButton.styleFrom(

                backgroundColor: const Color(0xFF311B92),

                foregroundColor: Colors.white,

              ),

              onPressed: () => Navigator.pop(context),

              child: const Text("Back to Home"),

            ),

          ],

        ),

      ),

    );

  }

}

