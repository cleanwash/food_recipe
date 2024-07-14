import 'package:food_recipe/data/model/recipe.dart';

abstract interface class RecipeDataSource {
    Future<List<Recipe>> getRecipes();

}