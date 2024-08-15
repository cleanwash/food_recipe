import 'package:flutter/material.dart';
import 'package:food_recipe/di/di_setup.dart';
import 'package:food_recipe/router/router.dart';
import 'package:food_recipe/ui/color_styles.dart';

void main() {

  diSetup(environment: Environment.prod); //.prod
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: ColorStyles.white,
      ),
      routerConfig: router,
    );
  }
}
