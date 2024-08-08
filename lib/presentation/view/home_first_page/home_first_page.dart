import 'package:flutter/material.dart';
import 'package:food_recipe/presentation/component/recipe_category_picker.dart';
import 'package:food_recipe/presentation/component/recipe_card.dart';
import 'package:food_recipe/ui/color_styles.dart';
import 'package:food_recipe/ui/text_styles.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:food_recipe/presentation/view/home_first_page/home_first_page_view_model.dart';
import 'package:food_recipe/domain/use_case/get_recipe_use_case.dart';

class HomeFirstPage extends StatelessWidget {
  HomeFirstPage({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GetIt.I<HomeFirstPageViewModel>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Consumer<HomeFirstPageViewModel>(
              builder: (context, viewModel, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    _buildHeader(),
                    const SizedBox(height: 25),
                    _buildSearchBar(context),
                    const SizedBox(height: 16),
                    RecipeCategoryPicker(
                      onCategorySelected: viewModel.selectCategory,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: viewModel.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : _buildRecipeGrid(viewModel, context),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hello Jega',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'What are you cooking today?',
              style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.orange[100],
          child: Image.asset('assets/icons/bold/avatar.png'),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            onTap: () => context.go('/search_recipe'),
            decoration: InputDecoration(
              hintText: 'Search recipe',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: ColorStyles.gray1),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => context.go('/saved_recipes'),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildRecipeGrid(HomeFirstPageViewModel viewModel, BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 3 / 4,
      ),
      itemCount: viewModel.getFilteredRecipes().length,
      itemBuilder: (context, index) {
        final recipe = viewModel.getFilteredRecipes()[index];
        return InkWell(
          onTap: () => context.push('/recipe_details', extra: recipe),
          child: Hero(
            tag: 'recipe_${recipe.title}',
            child: Card(
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: RecipeCard(recipe: recipe)),
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
  }
}