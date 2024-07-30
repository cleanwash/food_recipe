import 'package:food_recipe/core/change_notifer.dart';
import 'package:food_recipe/data/data_source/recipe_data_source_impl.dart';
import 'package:food_recipe/domain/model/recipe.dart';
import 'package:food_recipe/domain/use_case/get_recipe_use_case.dart';
import 'package:food_recipe/domain/use_case/search_recipe_use_case.dart';
import 'package:food_recipe/presentation/view/home_screen/home_screen.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe_detail.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe_view_model.dart';
import 'package:food_recipe/presentation/view/search_recipes/search_recipe.dart';
import 'package:food_recipe/presentation/view/sign_in/sign_in_page.dart';
import 'package:food_recipe/presentation/view/sign_up/sign_up_page.dart';
import 'package:food_recipe/presentation/view/splash_screen/splash_screen_page.dart';
import 'package:food_recipe/domain/repository/recipe_repository_impl.dart';
import 'package:go_router/go_router.dart';
import 'package:food_recipe/presentation/view/search_recipes/search_recipe_view_model.dart';

final recipeRepository = RecipeRepositoryImpl(RecipeDataSourceImpl());
final getRecipeUseCase = GetRecipeUseCase(recipeRepository);
final searchRecipeUseCase = SearchRecipeUseCase(getRecipeUseCase);
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
        final viewModel = SearchRecipeViewModel(
          getRecipeUseCase: getRecipeUseCase,
          searchRecipeUseCase: searchRecipeUseCase,
        );
        return SearchRecipe(searchRecipeViewModel: viewModel);
      },
    ),
  ],
);
