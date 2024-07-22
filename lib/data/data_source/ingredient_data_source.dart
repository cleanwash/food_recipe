// ingredient_data_source.dart
import 'package:food_recipe/data/model/ingredient.dart';

abstract class IngredientDataSource {
  Future<List<Ingredient>> getIngredients();
  Future<Ingredient?> getIngredientById(int id);
  Future<List<Ingredient>> searchIngredients(String query);
}