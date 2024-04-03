import 'package:flutter/material.dart';
import 'package:shopping_cart/presentation/category_screen/view/category_screen.dart';
import 'package:shopping_cart/presentation/home_screen/view/home_screen.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> screens = [HomeScreen(), CategoryScreen()];
}
