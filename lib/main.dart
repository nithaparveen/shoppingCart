import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/presentation/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:shopping_cart/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:shopping_cart/presentation/cart_screen/controller/cart_controller.dart';
import 'package:shopping_cart/presentation/category_screen/controller/category_controller.dart';
import 'package:shopping_cart/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:shopping_cart/presentation/home_screen/view/home_screen.dart';
import 'package:shopping_cart/presentation/splash_screen/view/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeScreenController()),
    ChangeNotifierProvider(create: (context) => BottomNavController()),
    ChangeNotifierProvider(create: (context) => CategoryController()),
    ChangeNotifierProvider(create: (context) => CartController()),

  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
