import 'package:flutter/material.dart';
import 'package:food_recipe/presentation/screen/home/home.dart';
import 'package:food_recipe/presentation/screen/sign_in/sign_in_page.dart';
import 'package:food_recipe/repository/recipe_repository.dart';
import 'package:food_recipe/repository/recipe_repository_impl.dart';
import 'package:food_recipe/data/data_source/recipe_data_source_impl.dart';
import 'package:food_recipe/ui/color_styles.dart';

void main() {
  final dataSource = RecipeDataSourceImpl();
  final repository = RecipeRepositoryImpl(dataSource);
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final RecipeRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: ColorStyles.white,
      ),
      home: HomeScreen(recipeRepository: repository),

    );
  }
}