import 'package:flutter/material.dart';
import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/domain/model/recipe.dart';
import 'package:food_recipe/domain/use_case/get_recipe_use_case.dart';
import 'package:food_recipe/domain/use_case/search_recipe_use_case.dart';

class SearchRecipeViewModel extends ChangeNotifier {
  final GetRecipeUseCase getRecipeUseCase;
  final SearchRecipeUseCase searchRecipeUseCase;

  SearchRecipeViewModel({
    required this.getRecipeUseCase,
    required this.searchRecipeUseCase
  }) {
    getSavedRecipes();
  }

  Result<List<Recipe>>? _recipes;
  Result<List<Recipe>>? get recipes => _recipes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getSavedRecipes() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await getRecipeUseCase.execute();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> searchRecipes(String word) async {
    print("Searching for: $word");

    _isLoading = true;
    notifyListeners();

    _recipes = await searchRecipeUseCase.execute(word);

    print("Search results: $_recipes");

    _isLoading = false;
    notifyListeners();
  }
}