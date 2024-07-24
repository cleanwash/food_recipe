/* import 'package:flutter/material.dart';
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
  }
}
*/

import 'package:flutter/material.dart';
import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/data/model/recipe.dart';
import 'package:food_recipe/repository/recipe_repository.dart';

class SavedRecipeViewModel extends ChangeNotifier {
  final RecipeRepository recipeRepository;
  List<Recipe> _recipes = [];
  bool _isLoading = false;
  String _error = '';

  SavedRecipeViewModel(this.recipeRepository) {
    fetchRecipes();
  }

  List<Recipe> get recipes => _recipes;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    final result = await recipeRepository.getRecipes();
    
    switch (result) {
      case Success<List<Recipe>>():
        _recipes = result.data;
        _error = '';
      case Error<List<Recipe>>():
        _error = result.e;
    }

    _isLoading = false;
    notifyListeners();
  }
}