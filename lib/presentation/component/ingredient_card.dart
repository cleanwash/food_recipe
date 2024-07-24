import 'package:flutter/material.dart';
import 'package:food_recipe/data/model/ingredient.dart';
import 'package:food_recipe/data/data_source/ingredient_data_source_impl.dart';

class IngredientItemCard extends StatefulWidget {
  const IngredientItemCard({Key? key}) : super(key: key);

  @override
  _IngredientItemCardState createState() => _IngredientItemCardState();
}

class _IngredientItemCardState extends State<IngredientItemCard> {
  final IngredientDataSourceImpl _dataSource = IngredientDataSourceImpl();
  List<Ingredient> _ingredients = [];

  @override
  void initState() {
    super.initState();
    _loadIngredients();
  }

  Future<void> _loadIngredients() async {
    final ingredients = await _dataSource.getIngredients();
    setState(() {
      _ingredients = ingredients;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _ingredients.length,
        itemBuilder: (context, index) {
          final ingredient = _ingredients[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      ingredient.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ingredient.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    ingredient.weight,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}