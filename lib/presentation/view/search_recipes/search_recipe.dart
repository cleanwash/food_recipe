import 'package:flutter/material.dart';
import 'package:food_recipe/core/change_notifer.dart';
import 'package:food_recipe/presentation/component/input_field.dart';
import 'package:food_recipe/presentation/component/recipe_card.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe_view_model.dart';
import 'package:food_recipe/presentation/view/search_recipes/search_recipe_view_model.dart';
import 'package:food_recipe/ui/color_styles.dart';
import 'package:food_recipe/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class SearchRecipe extends StatelessWidget {
  final SearchRecipeViewModel searchRecipeViewModel;

  const SearchRecipe({super.key, required this.searchRecipeViewModel});

  @override
  Widget build(BuildContext context) {
      final viewModel =
        ChangeNotifierProvider.of<SearchRecipeViewModel>(context).value;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Recipes', style: TextStyles.mediumTextBold),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 20.0),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Text('1'),
                ),
                const PopupMenuItem(
                  child: Text('2'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: InputField(
                    labelText: 'Search recipe',
                    hintText: 'search',
                    obscureText: false,
                    onChanged: (value) {
                      print("Input changed는: $value입니다, $value는 무엇일까요?"); // 디버그 프린트 추가
                      searchRecipeViewModel.searchRecipes(value);
                    },
                  ),
                ),
                const SizedBox(width: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: ColorStyles.primary100,
                    child: Icon(Icons.vaccines_outlined),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Search Results', style: TextStyles.normalTextBold),
            const SizedBox(height: 10),
            ListenableBuilder(
              listenable: searchRecipeViewModel,
              builder: (BuildContext context, Widget? child) {
                print(
                    "Building with recipes: ${searchRecipeViewModel.recipes}");
                if (searchRecipeViewModel.isLoading) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }
                final recipesResult = searchRecipeViewModel.recipes;
                if (recipesResult == null) {
                  return const Expanded(
                      child: Center(child: Text('No results available')));
                }
                return Expanded(
                  child: recipesResult.when(
                    success: (recipes) {
                      if (recipes.isEmpty) {
                        return const Center(child: Text('No results found'));
                      }
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 3 / 4,
                        ),
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];
                          return GestureDetector(
                            onTap: () =>
                                context.push('/recipe_details', extra: recipe),
                            child: Hero(
                              tag: 'recipe_${recipe.title}',
                              child: Card(
                                elevation: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: RecipeCard(
                                        recipe: recipe,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          recipe.title,
                                          style: TextStyles.smallTextBold,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    error: (error) {
                      return Center(child: Text('Error: $error'));
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
