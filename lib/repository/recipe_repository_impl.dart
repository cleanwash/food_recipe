import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/data/data_source/recipe_data_source.dart';
import 'package:food_recipe/data/data_source/recipe_data_source_impl.dart';
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
}

void main() async {
  final recipeDataSource = RecipeDataSourceImpl();
  final recipeRepository = RecipeRepositoryImpl(recipeDataSource);
  final test1 = await recipeRepository.getRecipes();
  // final result = await recipeRepository.getRecipes();
  print('test1은 $test1');
  print('recipeRepository는 $recipeRepository');
  // // result를 구체적으로 출력하기 위한 코드
  // result.when(
  //   success: (data) {
  //     print('Recipes: $data');
  //   },
  //   error: (message) {
  //     print('Error: $message');
  //   }
  // );
}