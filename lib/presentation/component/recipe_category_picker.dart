import 'package:flutter/material.dart';
import 'package:food_recipe/presentation/component/recipe_category_picker_view.dart';

class RecipeCategoryPicker extends StatefulWidget {
  final Function(String) onCategorySelected;

  const RecipeCategoryPicker({Key? key, required this.onCategorySelected}) : super(key: key);

  @override
  _RecipeCategoryPickerState createState() => _RecipeCategoryPickerState();
}

class _RecipeCategoryPickerState extends State<RecipeCategoryPicker> {
  late RecipeCategoryViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RecipeCategoryViewModel();
    _viewModel.selectedCategoryStream.listen((category) {
      widget.onCategorySelected(category);
      _showSnackBar(category);
    });
  }

  void _showSnackBar(String category) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected category: $category'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _viewModel.categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () => _viewModel.onSelectCategory(_viewModel.categories[index]),
              child: StreamBuilder<String>(
                stream: _viewModel.selectedCategoryStream,
                initialData: _viewModel.selectedCategory,
                builder: (context, snapshot) {
                  final isSelected = snapshot.data == _viewModel.categories[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: isSelected ? Colors.green : Colors.white),
                    ),
                    child: Center(
                      child: Text(
                        _viewModel.categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}