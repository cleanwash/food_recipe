import 'package:food_recipe/domain/model/recipe.dart';
import 'package:food_recipe/presentation/view/home_screen/home_screen.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe_detail.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe_detail_view.dart';
import 'package:food_recipe/presentation/view/search_recipes/search_recipe.dart';
import 'package:food_recipe/presentation/view/sign_in/sign_in_page.dart';
import 'package:food_recipe/presentation/view/sign_up/sign_up_page.dart';
import 'package:food_recipe/presentation/view/splash_screen/splash_screen_page.dart';
import 'package:food_recipe/presentation/view/search_recipes/search_recipe_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreenPage(),
    ),
    GoRoute(
      path: '/sign_in',
      builder: (context, state) => SignInPage(),
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/home_screen',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/saved_recipe',
      builder: (context, state) => const SavedRecipe(),
    ),
    GoRoute(
      path: '/saved_recipe_detail',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return ChangeNotifierProvider(
          create: (_) => SavedRecipeDetailViewModel(recipe: recipe),
          child: SavedRecipeDetail(recipe: recipe),
        );
      },
    ),
    GoRoute(
      path: '/search_recipe',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => GetIt.instance<SearchRecipeViewModel>(),
        child: const SearchRecipe(),
      ),
    ),
  ],
);
