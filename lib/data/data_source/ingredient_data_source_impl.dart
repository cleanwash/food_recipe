// ingredient_data_source_impl.dart
import 'package:food_recipe/data/data_source/ingredient_data_source.dart';
import 'package:food_recipe/data/model/ingredient.dart';

class IngredientDataSourceImpl implements IngredientDataSource {
  final Map<String, dynamic> ingredientsData = {
    "ingredients": [
      {
        "id": 1,
        "title": "토마토",
        "imageUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Tomato_je.jpg/1200px-Tomato_je.jpg",
        "weight": "500g",
      },
      {
        "id": 2,
        "title": "사과",
        "imageUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Tomato_je.jpg/1200px-Tomato_je.jpg",
        "weight": "1000g",
      },
      {
        "id": 3,
        "title": "복숭아",
        "imageUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Tomato_je.jpg/1200px-Tomato_je.jpg",
        "weight": "500g",
      },
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
