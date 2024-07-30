import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/domain/model/recipe.dart';
import 'package:food_recipe/domain/use_case/get_recipe_use_case.dart';

class SearchRecipeUseCase {
  final GetRecipeUseCase getRecipeUseCase;

  SearchRecipeUseCase(this.getRecipeUseCase);

  Future<Result<List<Recipe>>> execute(String query) async {
    final result = await getRecipeUseCase.execute();
    
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