import 'dart:async';

class RecipeCategoryViewModel {
  final List<String> categories = ['All', 'Indian', 'Italian', 'Asian', 'Chinese'];
  final _selectedCategoryController = StreamController<String>.broadcast();

  Stream<String> get selectedCategoryStream => _selectedCategoryController.stream;

  String _selectedCategory = 'All';

  void onSelectCategory(String category) {
    _selectedCategory = category;
    _selectedCategoryController.add(category);
  }

  String get selectedCategory => _selectedCategory;

  void dispose() {
    _selectedCategoryController.close();
  }
}