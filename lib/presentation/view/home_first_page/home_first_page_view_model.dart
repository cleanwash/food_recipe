import 'package:flutter/foundation.dart';
import 'package:food_recipe/domain/model/recipe.dart';
import 'package:food_recipe/domain/use_case/get_recipe_use_case.dart';

class HomeFirstPageViewModel extends ChangeNotifier {
  final GetRecipeUseCase _getRecipeUseCase;
  
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;
  
  String _selectedCategory = 'All';
  String get selectedCategory => _selectedCategory;
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  HomeFirstPageViewModel(this._getRecipeUseCase) {
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _getRecipeUseCase.execute();
      _recipes = result.when(
        success: (data) => data,
        error: (_) => [],
      );
    } catch (e) {
      print('Error loading recipes: $e');
      _recipes = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  List<Recipe> getFilteredRecipes() {
    if (_selectedCategory == 'All') {
      return _recipes;
    } else {
      return _recipes.where((recipe) => recipe.foodOrigin == _selectedCategory).toList();
    }
  }
}