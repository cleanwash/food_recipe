import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/data/model/ingredient.dart';

abstract interface class IngredientRepository {
  Future<Result<List<Ingredient>>> getIngredients();
  Future<Result<Ingredient?>> getIngredientById(int id);
  Future<Result<List<Ingredient>>> searchIngredients(String query);
}
