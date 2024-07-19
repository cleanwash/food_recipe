import 'package:flutter/material.dart';
import 'package:food_recipe/data/model/recipe.dart';


class SavedRecipeDetail extends StatelessWidget {
  final Recipe recipe;

  const SavedRecipeDetail({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Hero(
          tag: recipe.imgUrl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.black,
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Stack(
                    children: [
                      Image.network(
                        recipe.imgUrl,
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(recipe.rating.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 8,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${recipe.cookingTime} min',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                    color: Colors.white, shape: BoxShape.circle),
                                child: const ClipOval(
                                    child: Icon(
                                  Icons.bookmark_border,
                                  color: Colors.green,
                                )))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      recipe.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '(13k Reviews)',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   final dataSource = RecipeDataSourceImpl();
//   final repository = RecipeRepositoryImpl(dataSource);
//   runApp(MyApp(repository: repository));
// }

// class MyApp extends StatelessWidget {
//   final RecipeRepository repository;

//   const MyApp({super.key, required this.repository});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: GoRouter(
//         initialLocation: '/saved_recipe',
//         routes: [
//           GoRoute(
//             path: '/saved_recipe',
//             builder: (context, state) {
//               return SavedRecipe(recipeRepository: repository);
//             },
//           ),
//           GoRoute(
//             path: '/recipe_detail/:id',
//             builder: (context, state) {
//               final recipe = state.extra as Recipe;
//               return SavedRecipeDetail(recipe: recipe);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
