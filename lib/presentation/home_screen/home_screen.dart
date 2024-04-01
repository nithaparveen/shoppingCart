import 'package:flutter/material.dart';
import 'package:shopping_cart/core/constatnts/global_textstyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "SHOP",
          style: GLTextStyles.titleStyle,
        ),
      ),
    );
  }
}
