
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';



void main() {

  runApp(const KaidaFlashcards());

}



class KaidaFlashcards extends StatelessWidget {

  const KaidaFlashcards({super.key});



  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Kaida Flashcards',

      theme: ThemeData(

        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(

          seedColor: const Color(0xFF311B92),

          brightness: Brightness.dark,

        ),

        scaffoldBackgroundColor: const Color(0xFF0D0D1A),

        appBarTheme: const AppBarTheme(

          backgroundColor: Color(0xFF1A1A2E),

          elevation: 0,

          centerTitle: true,

        ),

      ),

      home: const HomeScreen(),

    );

  }

}

