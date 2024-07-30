import 'package:flutter/material.dart';
import 'package:food_recipe/data/data_source/creator_profile_data_source.dart';
import 'package:food_recipe/data/data_source/ingredient_data_source_impl.dart';
import 'package:food_recipe/data/data_source/procedure_data_source_impl.dart';
import 'package:food_recipe/data/model/creatorProfile.dart';
import 'package:food_recipe/data/model/ingredient.dart';
import 'package:food_recipe/data/model/procedure.dart';
import 'package:food_recipe/domain/model/recipe.dart';

class SavedRecipeDetailViewModel extends ChangeNotifier {
  final CreatorProfileDataSource creatorDataSource;
  final IngredientDataSourceImpl ingredientDataSource;
  final ProcedureDataSourceImpl procedureDataSource;
  final Recipe recipe;

  List<Ingredient> _ingredients = [];
  List<Procedure> _procedures = [];
  bool _showIngredients = true;
  late CreatorProfile _creatorProfile;

  SavedRecipeDetailViewModel({
    required this.creatorDataSource,
    required this.ingredientDataSource,
    required this.procedureDataSource,
    required this.recipe,
  });

  List<Ingredient> get ingredients => _ingredients;
  List<Procedure> get procedures => _procedures;
  bool get showIngredients => _showIngredients;
  CreatorProfile get creatorProfile => _creatorProfile;

  void loadData() async {
    await _loadIngredients();
    await _loadProcedures();
    _loadCreatorProfile();
    notifyListeners();
  }

  Future<void> _loadIngredients() async {
    _ingredients = await ingredientDataSource.getIngredients();
  }

  Future<void> _loadProcedures() async {
    _procedures = await procedureDataSource.getProcedures();
  }

  void _loadCreatorProfile() {
    List<CreatorProfile> profiles = creatorDataSource.getCreatorProfiles();
    _creatorProfile = profiles.first;
  }

  void toggleIngredients() {
    _showIngredients = !_showIngredients;
    notifyListeners();
  }
}