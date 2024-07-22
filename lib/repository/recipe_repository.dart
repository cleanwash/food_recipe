import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/data/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>>> getRecipes();
  Future<Result<List<Recipe>>> searchRecipes(String query);
}
