import 'package:flutter/material.dart';
import 'package:food_recipe/data/model/recipe.dart';
import 'package:food_recipe/repository/recipe_repository.dart';
import 'package:food_recipe/core/result.dart';

class SavedRecipeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipeViewModel(this._recipeRepository) {
    fetchSavedRecipes();
  }

  List<Recipe> _savedRecipes = [];
  List<Recipe> get savedRecipes => _savedRecipes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchSavedRecipes() async {
    _isLoading = true;
    notifyListeners();

  //   try {
  //     final result = await _recipeRepository.getRecipes();
  //     switch (result) {
  //       case Success<List<Recipe>>():
  //         _savedRecipes = result.data;
  //       case Error<List<Recipe>>():
  //         _savedRecipes = [];
  //         print("Error fetching recipes: ${result.e}");
  //     }
  //   } catch (e) {
  //     _savedRecipes = [];
  //     print("Exception occurred: $e");
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
}
}