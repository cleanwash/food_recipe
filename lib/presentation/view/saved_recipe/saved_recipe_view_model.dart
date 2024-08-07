import 'package:flutter/material.dart';
import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/data/data_source/creator_profile_data_source.dart';
import 'package:food_recipe/data/data_source/ingredient_data_source.dart';
import 'package:food_recipe/data/data_source/procedure_data_source.dart';
import 'package:food_recipe/domain/model/recipe.dart';
import 'package:food_recipe/domain/repository/recipe_repository.dart';
import 'package:get_it/get_it.dart';

class SavedRecipeViewModel extends ChangeNotifier {
   final CreatorProfileDataSource creatorDataSource;
  final IngredientDataSource ingredientDataSource;
  final ProcedureDataSource procedureDataSource;
  final RecipeRepository recipeRepository;
  List<Recipe> _recipes = [];
  bool _isLoading = false;
  String _error = '';

 SavedRecipeViewModel()
      : creatorDataSource = GetIt.instance<CreatorProfileDataSource>(),
        ingredientDataSource = GetIt.instance<IngredientDataSource>(),
        procedureDataSource = GetIt.instance<ProcedureDataSource>(),
        recipeRepository = GetIt.instance<RecipeRepository>() {
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