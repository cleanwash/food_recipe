import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  factory Recipe({
    required int id,
    required String title,
    required String chef,
    required double rating,
    required int cookingTime,
    required bool isFavorite,
    required String imgUrl,
    required String foodOrigin,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
