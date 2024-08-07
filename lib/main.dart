import 'package:flutter/material.dart';
import 'package:food_recipe/di/di_setup.dart';
import 'package:food_recipe/domain/repository/recipe_repository.dart';
import 'package:food_recipe/domain/repository/recipe_repository_impl.dart';
import 'package:food_recipe/data/data_source/recipe_data_source_impl.dart';
import 'package:food_recipe/router/router.dart';
import 'package:food_recipe/ui/color_styles.dart';

void main() {
  diSetup();
  final dataSource = RecipeDataSourceImpl();
  final repository = RecipeRepositoryImpl(dataSource);
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final RecipeRepository repository;

  const MyApp({super.key, required this.repository});

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
