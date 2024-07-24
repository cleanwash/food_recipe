import 'package:food_recipe/data/data_source/recipe_data_source.dart';
import 'package:food_recipe/data/model/recipe.dart';

  class RecipeDataSourceImpl implements RecipeDataSource {
 @override
  Future<List<Recipe>> getRecipes() async {
    return [
      Recipe(
        id : 1, 
        title: 'Onsen Tamago',
        chef: 'Chef Seiki',
        rating: 4.5,
        cookingTime: 30,
        isFavorite: true,
        imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKTmPrISo38YhEtZX6lEDDXFUvmaXWi2brVw&s',
        
      ),
      Recipe(
        id: 2, 
        title: 'Ochazuke',
        chef: 'Chef Mugikura',
        rating: 4.3,
        cookingTime: 10,
        isFavorite: false,
        imgUrl: 'https://www.justonecookbook.com/wp-content/uploads/2020/01/Ochazuke-9037-I.jpg',
      ),
          Recipe(
            id: 3, 
        title: 'Hiroshima Okonomiyaki',
        chef: 'Chef Uenohara',
        rating: 4.9,
        cookingTime: 20,
        isFavorite: false,
        imgUrl: 'https://japan.recipetineats.com/wp-content/uploads/2020/12/Hiroshima_Okonomiyaki_5402sq.jpg',
      ),
      Recipe(
        id: 4, 
        title: 'Sukiyaki',
        chef: 'Chef Imafuku',
        rating: 4.3,
        cookingTime: 40,
        isFavorite: false,
        imgUrl: 'https://japanesetaste.com/cdn/shop/articles/how-to-make-sukiyaki-at-home-kansai-sukiyaki-recipe-japanese-taste.jpg?v=1694487084&width=600',
      ),
    ];
  }
}