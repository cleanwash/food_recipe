import 'package:flutter/material.dart';
import 'package:food_recipe/data/model/ingredient.dart';
import 'package:food_recipe/data/model/procedure.dart';
import 'package:food_recipe/repository/ingredient_repository.dart';
import 'package:food_recipe/repository/procedure_repository.dart';

class SavedRecipeDetailView with ChangeNotifier {
  final IngredientRepository _ingredientRepository;
  final ProcedureRepository _procedureRepository;

  SavedRecipeDetailView(
    this._ingredientRepository,
    this._procedureRepository,
  ) {
    fetchIngredients();
    fetchProcedures();
  }

  List<Ingredient> _ingredients = [];
  List<Ingredient> get ingredients => _ingredients;

  List<Procedure> _procedures = [];
  List<Procedure> get procedures => _procedures;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = '';
  String get error => _error;

  Future<void> fetchIngredients() async {
    final result = await _ingredientRepository.getIngredients();
    result.when(
      success: (ingredients) {
        _ingredients = ingredients;
        notifyListeners();
      },
      error: (message) {
        _error = message;
        notifyListeners();
      },
    );
  }

  Future<void> fetchProcedures() async {
    final result = await _procedureRepository.getProcedures();
    result.when(
      success: (procedures) {
        _procedures = procedures;
        notifyListeners();
      },
      error: (message) {
        _error = message;
        notifyListeners();
      },
    );
  }

  Future<void> getIngredients(int recipeId) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    final result = await _ingredientRepository.getIngredients();
    result.when(
      success: (ingredients) {
        _ingredients = ingredients
            .where((ingredient) => ingredient.id == recipeId)
            .toList();
        _isLoading = false;
        notifyListeners();
      },
      error: (message) {
        _error = message;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> getProcedures(int recipeId) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    final result = await _procedureRepository.getProcedures();
    result.when(
      success: (procedures) {
        _procedures = procedures
            .where((procedure) => procedure.id == recipeId)
            .toList()
          ..sort((a, b) => a.stepNum.compareTo(b.stepNum));
        _isLoading = false;
        notifyListeners();
      },
      error: (message) {
        _error = message;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}

