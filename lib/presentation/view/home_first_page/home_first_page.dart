import 'package:flutter/material.dart';
import 'package:food_recipe/ui/color_styles.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const HomeFirstPage());
}

class HomeFirstPage extends StatelessWidget {
  const HomeFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Jega App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HelloJegaWidget(),
      ),
    );
  }
}

class HelloJegaWidget extends StatelessWidget {
  HelloJegaWidget({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello Jega',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'What are you cooking today?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.orange[100],
                child: Image.asset('assets/icons/bold/avatar.png'),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onTap: () {
                    // TextField를 탭하면 SavedRecipes 페이지로 이동
                    GoRouter.of(context).go('/saved_recipes');
                  },
                  decoration: InputDecoration(
                    hintText: 'Search recipe',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: ColorStyles.gray1), // 테두리 색상 설정
                    ),
                    filled: true,
                    fillColor: Colors.grey[200], // 배경색 설정
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  // 'Filter' 아이콘을 탭하면 SavedRecipes 페이지로 이동
                  GoRouter.of(context).go('/saved_recipes');
                },
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
          ),
        ],
      ),
    );
  }
}
