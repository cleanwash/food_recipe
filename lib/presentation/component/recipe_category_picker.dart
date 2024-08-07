import 'package:flutter/material.dart';
import 'dart:async';



class RecipeCategoryPicker extends StatefulWidget {
  final Function(String) onSelectCategory;

  const RecipeCategoryPicker({Key? key, required this.onSelectCategory}) : super(key: key);

  @override
  _RecipeCategoryPickerState createState() => _RecipeCategoryPickerState();
}

class _RecipeCategoryPickerState extends State<RecipeCategoryPicker> {
  final List<String> categories = ['All', 'Indian', 'Italian', 'Asian', 'Chinese'];
  late RecipeCategoryViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RecipeCategoryViewModel();
    _viewModel.eventStream.listen((event) {
      switch (event) {
        case ShowSuccessMessage():
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected category: ${event.message}')),
          );
        case ShowErrorMessage():
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${event.data}')),
          );
      }
    });
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
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                _viewModel.selectCategory(categories[index]);
                widget.onSelectCategory(categories[index]);
              },
              child: StreamBuilder<String>(
                stream: _viewModel.selectedCategoryStream,
                initialData: 'All',
                builder: (context, snapshot) {
                  final isSelected = snapshot.data == categories[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
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

class RecipeCategoryViewModel {
  final _eventController = StreamController<RecipeCategoryEvent>();
  final _selectedCategoryController = StreamController<String>.broadcast();

  Stream<RecipeCategoryEvent> get eventStream => _eventController.stream;
  Stream<String> get selectedCategoryStream => _selectedCategoryController.stream;

  void selectCategory(String category) {
    _selectedCategoryController.add(category);
    _eventController.add(RecipeCategoryEvent.showSuccessMessage(category));
  }

  void dispose() {
    _eventController.close();
    _selectedCategoryController.close();
  }
}

sealed class RecipeCategoryEvent {
  const factory RecipeCategoryEvent.showErrorMessage(String message) = ShowErrorMessage;
  const factory RecipeCategoryEvent.showSuccessMessage(String message) = ShowSuccessMessage;
}

class ShowErrorMessage implements RecipeCategoryEvent {
  final String data;
  const ShowErrorMessage(this.data);
}

class ShowSuccessMessage implements RecipeCategoryEvent {
  final String message;
  const ShowSuccessMessage(this.message);
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RecipeCategoryPicker(
          onSelectCategory: (category) {
            // 여기서 필요한 추가 작업을 수행할 수 있습니다.
            print('Selected category: $category');
          },
        ),
      ),
    );
  }
}