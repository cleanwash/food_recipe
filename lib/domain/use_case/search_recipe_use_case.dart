import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/domain/model/recipe.dart';
import 'package:food_recipe/domain/repository/recipe_repository.dart';

class SearchRecipeUseCase {
  final RecipeRepository recipeRepository;

  SearchRecipeUseCase(this.recipeRepository);

  Future<Result<List<Recipe>>> execute(String query) async {
    final result = await recipeRepository.getRecipes();
    
    return result.when(
      success: (recipes) {
        final filteredRecipes = recipes.where((recipe) =>
          recipe.title.toLowerCase().contains(query.toLowerCase())
        ).toList();
        return Result.success(filteredRecipes);
      },
      error: (e) => Result.error(e),
    );
  }
}