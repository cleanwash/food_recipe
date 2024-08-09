import 'package:flutter/material.dart';
import 'package:food_recipe/data/data_source/creator_profile_data_source.dart';
import 'package:food_recipe/data/data_source/ingredient_data_source.dart';
import 'package:food_recipe/data/data_source/procedure_data_source.dart';
import 'package:food_recipe/data/model/creatorProfile.dart';
import 'package:food_recipe/data/model/ingredient.dart';
import 'package:food_recipe/data/model/procedure.dart';
import 'package:food_recipe/domain/model/recipe.dart';
import 'package:food_recipe/domain/use_case/recipe_link_use_case.dart';
import 'package:get_it/get_it.dart';

class SavedRecipeDetailViewModel extends ChangeNotifier {
  final CreatorProfileDataSource creatorDataSource;
  final IngredientDataSource ingredientDataSource;
  final ProcedureDataSource procedureDataSource;
  final Recipe recipe;
  final CopyLinkUseCase copyLinkUseCase;

  List<Ingredient> _ingredients = [];
  List<Procedure> _procedures = [];
  bool _showIngredients = true;
  late CreatorProfile _creatorProfile;

  SavedRecipeDetailViewModel({required this.recipe})
      : creatorDataSource = GetIt.instance<CreatorProfileDataSource>(),
        ingredientDataSource = GetIt.instance<IngredientDataSource>(),
        copyLinkUseCase = GetIt.instance<CopyLinkUseCase>(),
        procedureDataSource = GetIt.instance<ProcedureDataSource>() {
    loadData();
  }

  List<Ingredient> get ingredients => _ingredients;
  List<Procedure> get procedures => _procedures;
  bool get showIngredients => _showIngredients;
  CreatorProfile get creatorProfile => _creatorProfile;

  Future<void> loadData() async {
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

  Future<void> copyRecipeLink() async {
    String link = 'app.Recipe.co/';
    await copyLinkUseCase.execute(link);
  }
}
