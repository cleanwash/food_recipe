import 'package:flutter/material.dart';
import 'package:food_recipe/data/model/recipe.dart';
import 'package:food_recipe/presentation/component/recipe_card.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe_view_model.dart';
import 'package:food_recipe/repository/recipe_repository.dart';
import 'package:food_recipe/ui/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SavedRecipe extends StatelessWidget {
  final RecipeRepository recipeRepository;
  const SavedRecipe({super.key, required this.recipeRepository});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SavedRecipeViewModel>(
      create: (_) => SavedRecipeViewModel(recipeRepository),
      child: const _SavedRecipeContent(),
    );
  }
}

class _SavedRecipeContent extends StatelessWidget {
  const _SavedRecipeContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SavedRecipeViewModel>();

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 54.0, bottom: 10),
            child: Text(
              'Saved recipes',
              style: TextStyles.mediumTextBold,
            ),
          ),
        ),
        Expanded(
          child: Builder(
            builder: (BuildContext context) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (viewModel.error.isNotEmpty) {
                return Center(child: Text(viewModel.error));
              }
              return ListView.builder(
                itemCount: viewModel.recipes.length,
                itemBuilder: (context, index) {
                  final recipe = viewModel.recipes[index];
                  return GestureDetector(
                    onTap: () {
                      context.push('/saved_recipe_detail', extra: recipe);
                    },
                    child: RecipeCard(recipe: recipe),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}