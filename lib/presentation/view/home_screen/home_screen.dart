import 'package:flutter/material.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe.dart';
import 'package:food_recipe/presentation/view/home_first_page/home_first_page.dart';
import 'package:food_recipe/domain/repository/recipe_repository.dart';
import 'package:food_recipe/router/router.dart';
import 'package:food_recipe/ui/color_styles.dart';

class HomeScreen extends StatefulWidget {
  final RecipeRepository recipeRepository;

   const HomeScreen({super.key, required this.recipeRepository});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      HomeFirstPage(),
      SavedRecipe(recipeRepository: recipeRepository,),
      const Text('Notification Page'),
      const Text('Profile Page'),
    ];
 return Scaffold(
      body: SafeArea(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/outline/home.png',
              width: 24,
              height: 24,
              color: ColorStyles.gray4,
            ),
            activeIcon: Image.asset(
              'assets/icons/bold/home_selected.png',
              width: 24,
              height: 24,
              color: ColorStyles.primary100,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/outline/book_mark.png',
              width: 24,
              height: 24,
              color: ColorStyles.gray4,
            ),
            activeIcon: Image.asset(
              'assets/icons/bold/book_mark_selected.png',
              width: 24,
              height: 24,
              color: ColorStyles.primary100,
            ),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/outline/bell.png',
              width: 24,
              height: 24,
              color: ColorStyles.gray4,
            ),
            activeIcon: Image.asset(
              'assets/icons/bold/bell_selected.png',
              width: 24,
              height: 24,
              color: ColorStyles.primary100,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/outline/profile.png',
              width: 24,
              height: 24,
              color: ColorStyles.gray4,
            ),
            activeIcon: Image.asset(
              'assets/icons/bold/profile_selected.png',
              width: 24,
              height: 24,
              color: ColorStyles.primary100,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}