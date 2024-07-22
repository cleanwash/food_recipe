import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/data/data_source/recipe_data_source.dart';
import 'package:food_recipe/data/model/recipe.dart';
import 'package:food_recipe/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl(this._recipeDataSource);

  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    try {
      final data = await _recipeDataSource.getRecipes();
      return Result.success(data);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<List<Recipe>>> searchRecipes(String query) async {
    try {
      final allRecipes = await _recipeDataSource.getRecipes();
      final filteredRecipes = allRecipes
          .where((recipe) =>
              recipe.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      print("RecipeRepositoryImpl - Filtered recipes: $filteredRecipes");
      return Result.success(filteredRecipes);
    } catch (e) {
      print("RecipeRepositoryImpl - Search error: $e");
      return Result.error(e.toString());
    }
  }
}
