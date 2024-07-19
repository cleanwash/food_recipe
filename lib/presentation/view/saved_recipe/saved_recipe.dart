import 'package:flutter/material.dart';
import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/data/model/recipe.dart';
import 'package:food_recipe/presentation/component/recipe_card.dart';
import 'package:food_recipe/repository/recipe_repository.dart';
import 'package:food_recipe/ui/text_styles.dart';
import 'package:go_router/go_router.dart';


class SavedRecipe extends StatelessWidget {
  final RecipeRepository recipeRepository;

  const SavedRecipe({super.key, required this.recipeRepository});

  @override
  Widget build(BuildContext context) {
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
          child: FutureBuilder(
              future: recipeRepository.getRecipes(),
              builder: (BuildContext context,
                  AsyncSnapshot<Result<List<Recipe>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final result = snapshot.data!;


                switch (result) {
              case Success<List<Recipe>>():
                return ListView.builder(
                  itemCount: result.data.length,
                  itemBuilder: (context, index) {
                    final recipe = result.data[index];
                    return GestureDetector(
                        onTap: () {
                          context.push('/saved_recipe_detail', extra: recipe);
                        },
                        child: RecipeCard(recipe: recipe));
                  },
                );




                  case Error<List<Recipe>>():
                    return Text(result.e);
                }
              }),
        ),
      ],
    );
  }
}
