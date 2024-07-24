import 'package:flutter/material.dart';
import 'package:food_recipe/data/data_source/creator_profile_data_source.dart';
import 'package:food_recipe/data/model/creatorProfile.dart';
import 'package:food_recipe/data/model/recipe.dart';
import 'package:food_recipe/presentation/component/creator_profile_card.dart';
import 'package:food_recipe/data/data_source/ingredient_data_source_impl.dart';
import 'package:food_recipe/data/model/ingredient.dart';
import 'package:food_recipe/data/data_source/procedure_data_source_impl.dart';
import 'package:food_recipe/data/model/procedure.dart';
import 'package:food_recipe/presentation/view/saved_recipe/saved_recipe_detail_view.dart';

class SavedRecipeDetail extends StatefulWidget {

  final Recipe recipe;

  const SavedRecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _SavedRecipeDetailState createState() => _SavedRecipeDetailState();
}

class _SavedRecipeDetailState extends State<SavedRecipeDetail> {
  final CreatorProfileDataSource creatorDataSource = CreatorProfileDataSource();
  final IngredientDataSourceImpl ingredientDataSource =IngredientDataSourceImpl();
  final ProcedureDataSourceImpl procedureDataSource = ProcedureDataSourceImpl();
  List<Ingredient> _ingredients = [];
  List<Procedure> _procedures = [];
  bool _showIngredients = true;

  @override
  void initState() {
    super.initState();
    _loadIngredients();
    _loadProcedures();
  }

  Future<void> _loadIngredients() async {
    final ingredients = await ingredientDataSource.getIngredients();
    setState(() {
      _ingredients = ingredients;
    });
  }

  Future<void> _loadProcedures() async {
    final procedures = await procedureDataSource.getProcedures();
    setState(() {
      _procedures = procedures;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<CreatorProfile> profiles = creatorDataSource.getCreatorProfiles();
    CreatorProfile creatorProfile = profiles.first;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.recipe.imgUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text(
                            widget.recipe.rating.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.timer_sharp,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text('${widget.recipe.cookingTime} min'),
                        ),
                        SizedBox(width: 8),
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/icons/outline/book_mark.png',
                              color: Colors.green,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.recipe.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '(13k Reviews)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CreatorProfileCard(creatorProfile: creatorProfile),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _showIngredients = true;
                            });
                          },
                          child: Text('Ingredient'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _showIngredients ? Colors.green : Colors.white,
                            foregroundColor:
                                _showIngredients ? Colors.white : Colors.green,
                            side: BorderSide(color: Colors.green),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _showIngredients = false;
                            });
                          },
                          child: Text('Procedure'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                !_showIngredients ? Colors.green : Colors.white,
                            foregroundColor:
                                !_showIngredients ? Colors.white : Colors.green,
                            side: BorderSide(color: Colors.green),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.restaurant, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('1 serve'),
                      Spacer(),
                      Text(
                        _showIngredients
                            ? '${_ingredients.length} items'
                            : '${_procedures.length} steps',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  if (_showIngredients)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _ingredients.length,
                      itemBuilder: (context, index) {
                        final ingredient = _ingredients[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8.0),
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
                                  child: Text(
                                    ingredient.title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _procedures.length,
                      itemBuilder: (context, index) {
                        final procedure = _procedures[index];
                        return Card(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Step ${procedure.stepNum}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  procedure.description,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

