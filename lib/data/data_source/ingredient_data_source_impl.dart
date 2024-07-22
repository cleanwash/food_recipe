// ingredient_data_source_impl.dart
import 'package:food_recipe/data/data_source/ingredient_data_source.dart';
import 'package:food_recipe/data/model/ingredient.dart';

class IngredientDataSourceImpl implements IngredientDataSource {
  final Map<String, dynamic> ingredientsData = {
    "ingredients": [
      {
        "id": 1,
        "imageUrl": "http://example.com/tomato.jpg",
        "title": "Tomato",
        "weight": "100g"
      },
      {
        "id": 2,
        "imageUrl": "http://example.com/onion.jpg",
        "title": "Onion",
        "weight": "50g"
      },
      {
        "id": 3,
        "imageUrl": "http://example.com/garlic.jpg",
        "title": "Garlic",
        "weight": "10g"
      },
      {
        "id": 4,
        "imageUrl": "http://example.com/beef.jpg",
        "title": "Beef",
        "weight": "200g"
      }
    ]
  };

  late final List<Ingredient> _ingredients;

  IngredientDataSourceImpl() {
    _ingredients = _initIngredients();
  }

  List<Ingredient> _initIngredients() {
    return (ingredientsData['ingredients'] as List)
        .map((json) => Ingredient.fromJson(json))
        .toList();
  }

  @override
  Future<List<Ingredient>> getIngredients() async {
    return _ingredients;
  }

  @override
  Future<Ingredient?> getIngredientById(int id) async {
    try {
      return _ingredients.firstWhere((ingredient) => ingredient.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Ingredient>> searchIngredients(String query) async {
    return _ingredients
        .where((ingredient) =>
            ingredient.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}