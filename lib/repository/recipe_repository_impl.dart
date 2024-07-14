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
      print('e는 $e');
      return Result.error(e.toString());
    }
  }
}
