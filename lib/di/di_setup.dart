import 'package:food_recipe/data/data_source/creator_profile_data_source.dart';
import 'package:food_recipe/data/data_source/ingredient_data_source.dart';
import 'package:food_recipe/data/data_source/ingredient_data_source_impl.dart';
import 'package:food_recipe/data/data_source/procedure_data_source.dart';
import 'package:food_recipe/data/data_source/procedure_data_source_impl.dart';
import 'package:food_recipe/data/data_source/recipe_data_source.dart';
import 'package:food_recipe/data/data_source/recipe_data_source_impl.dart';
import 'package:food_recipe/domain/repository/recipe_repository.dart';
import 'package:food_recipe/domain/repository/recipe_repository_impl.dart';
import 'package:food_recipe/domain/use_case/get_recipe_use_case.dart';
import 'package:food_recipe/domain/use_case/search_recipe_use_case.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe_view_model.dart';
import 'package:food_recipe/presentation/view/search_recipes/search_recipe_view_model.dart';
import 'package:food_recipe/repository/ingredient_repository.dart';
import 'package:food_recipe/repository/ingredient_repository_impl.dart';
import 'package:food_recipe/repository/procedure_repository.dart';
import 'package:food_recipe/repository/procedure_repository_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerFactory<CreatorProfileDataSource>(() => CreatorProfileDataSource());
  getIt.registerFactory<IngredientDataSource>(() => IngredientDataSourceImpl());
  getIt.registerFactory<ProcedureDataSource>(() => ProcedureDataSourceImpl());
  getIt.registerSingleton<RecipeDataSource>(RecipeDataSourceImpl());

  getIt.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(getIt<RecipeDataSource>()));
  getIt.registerSingleton<IngredientRepository>(IngredientRepositoryImpl(getIt()));
  getIt.registerSingleton<ProcedureRepository>(ProcedureRepositoryImpl(getIt()));

  getIt.registerSingleton(GetRecipeUseCase(getIt()));
  getIt.registerSingleton(SearchRecipeUseCase(getIt()));

  getIt.registerFactory<SavedRecipeViewModel>(() => SavedRecipeViewModel());
  getIt.registerFactory<SearchRecipeViewModel>(() => SearchRecipeViewModel());
}