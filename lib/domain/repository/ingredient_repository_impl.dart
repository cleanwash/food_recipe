// ingredient_repository_impl.dart
import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/data/data_source/ingredient_data_source.dart';
import 'package:food_recipe/data/model/ingredient.dart';
import 'package:food_recipe/domain/repository/ingredient_repository.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientDataSource _dataSource;

  IngredientRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Ingredient>>> getIngredients() async {
    try {
      final ingredients = await _dataSource.getIngredients();
      return Result.success(ingredients);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<Ingredient?>> getIngredientById(int id) async {
    try {
      final ingredient = await _dataSource.getIngredientById(id);
      return Result.success(ingredient);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<List<Ingredient>>> searchIngredients(String query) async {
    try {
      final ingredients = await _dataSource.searchIngredients(query);
      return Result.success(ingredients);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}