import 'package:flutter/material.dart';
import 'package:food_recipe/presentation/screen/home/home_screen.dart';
import 'package:food_recipe/presentation/screen/navigation/navigation.dart';
import 'package:food_recipe/presentation/screen/sign_in/sign_in_page.dart';
import 'package:food_recipe/ui/color_styles.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: ColorStyles.white, 
      ),
      home: const HomeScreen(),
      // routes: {
      // },
    );
  }
}