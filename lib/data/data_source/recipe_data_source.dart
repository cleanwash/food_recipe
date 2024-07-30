import 'package:food_recipe/domain/model/recipe.dart';

abstract interface class RecipeDataSource {
    Future<List<Recipe>> getRecipes();

}