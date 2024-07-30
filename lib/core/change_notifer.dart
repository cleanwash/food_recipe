import 'package:flutter/material.dart';


class ChangeNotifierProvider<T extends ChangeNotifier> extends InheritedWidget {
  final T value;

  const ChangeNotifierProvider({
    Key? key,
    required Widget child,
    required this.value,
  }) : super(key: key, child: child);

  static ChangeNotifierProvider<T> of<T extends ChangeNotifier>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ChangeNotifierProvider<T>>();
    if (provider == null) {
      throw FlutterError('ChangeNotifierProvider<$T> not found in context');
    }
    return provider;
  }

  @override
  bool updateShouldNotify(ChangeNotifierProvider oldWidget) {
    return value != oldWidget.value;
  }
}