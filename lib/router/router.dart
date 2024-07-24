import 'package:food_recipe/core/change_notifer.dart';
import 'package:food_recipe/data/data_source/recipe_data_source_impl.dart';
import 'package:food_recipe/data/model/creatorProfile.dart';
import 'package:food_recipe/data/model/recipe.dart';
import 'package:food_recipe/presentation/view/home_screen/home_screen.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe_detail.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe_detail_view.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe_view_model.dart';
import 'package:food_recipe/presentation/view/search_recipes/search_recipe.dart';
import 'package:food_recipe/presentation/view/sign_in/sign_in_page.dart';
import 'package:food_recipe/presentation/view/sign_up/sign_up_page.dart';
import 'package:food_recipe/presentation/view/splash_screen/splash_screen_page.dart';
import 'package:food_recipe/repository/ingredient_repository.dart';
import 'package:food_recipe/repository/ingredient_repository_impl.dart';
import 'package:food_recipe/repository/procedure_repository.dart';
import 'package:food_recipe/repository/procedure_repository_impl.dart';
import 'package:food_recipe/repository/recipe_repository_impl.dart';
import 'package:go_router/go_router.dart';
import 'package:food_recipe/presentation/view/search_recipes/search_recipe_view_model.dart';

final recipeRepository = RecipeRepositoryImpl(RecipeDataSourceImpl());
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreenPage(),
    ),
    GoRoute(
      path: '/sign_in',
      builder: (context, state) => SignInPage(), // 수정: const 제거
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => SignUpPage(), // 수정: const 제거
    ),
    GoRoute(
      path: '/home_screen',
      builder: (context, state) => HomeScreen(
        recipeRepository: recipeRepository,
      ),
    ),
 GoRoute(
      path: '/saved_recipe',
      builder: (context, state) => ChangeNotifierProvider<SavedRecipeViewModel>(
        value: SavedRecipeViewModel(recipeRepository),
        child: SavedRecipe(
          recipeRepository: recipeRepository,
        ),
      ),
    ),
    GoRoute(
      path: '/saved_recipe_detail',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return SavedRecipeDetail(recipe: recipe);
      },
    ),
    GoRoute(
      path: '/search_recipe',
      builder: (context, state) {
        final searchRecipeViewModel = SearchRecipeViewModel(recipeRepository);
        return SearchRecipe(
          searchRecipeViewModel: searchRecipeViewModel,
        );
      },
    ),
  ],
);
