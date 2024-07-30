import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/domain/model/recipe.dart';
import 'package:food_recipe/domain/repository/recipe_repository.dart';

class GetRecipeUseCase {
  final RecipeRepository recipeRepository;

  GetRecipeUseCase(this.recipeRepository);

  Future<Result<List<Recipe>>> execute() async {
    return await recipeRepository.getRecipes();
  }
}