import 'package:flutter/material.dart';
import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/data/model/recipe.dart';
import 'package:food_recipe/repository/recipe_repository.dart';

class SavedRecipeViewModel extends ChangeNotifier {
  final RecipeRepository recipeRepository;

  SavedRecipeViewModel(this.recipeRepository) {
    fetchSavedRecipes();
  }

  Result<List<Recipe>>? _recipes;
  Result<List<Recipe>>? get recipes => _recipes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchSavedRecipes() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await recipeRepository.getRecipes();

    _isLoading = false;
    notifyListeners();
  }
}
