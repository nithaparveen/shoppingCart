
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:shopping_cart/presentation/home_screen/view/home_screen.dart';

void main() {
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> HomeScreenController())
  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
