
import 'package:flutter/material.dart';

import 'quiz_screen.dart';



class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});



  final List<String> categories = const [

    'Flutter Basics',

    'Dart Logic',

    'UI Design',

    'State Management',

    'Git & Termux',

    'Cloud Build'

  ];



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("Kaida Flashcards"),

      ),

      body: Padding(

        padding: const EdgeInsets.all(16.0),

        child: GridView.builder(

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount: 2,

            crossAxisSpacing: 16,

            mainAxisSpacing: 16,

          ),

          itemCount: categories.length,

          itemBuilder: (context, index) {

            return InkWell(

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (context) => QuizScreen(category: categories[index]),

                  ),

                );

              },

              child: Container(

                decoration: BoxDecoration(

                  color: const Color(0xFF311B92),

                  borderRadius: BorderRadius.circular(15),

                  boxShadow: [

                    BoxShadow(

                      color: Colors.black.withOpacity(0.3),

                      blurRadius: 8,

                      offset: const Offset(0, 4),

                    )

                  ],

                ),

                child: Center(

                  child: Text(

                    categories[index],

                    textAlign: TextAlign.center,

                    style: const TextStyle(

                      color: Colors.white,

                      fontWeight: FontWeight.bold,

                      fontSize: 18,

                    ),

                  ),

                ),

              ),

            );

          },

        ),

      ),

    );

  }

}

