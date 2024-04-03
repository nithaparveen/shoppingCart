import 'package:flutter/material.dart';
import 'package:shopping_cart/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';

import '../../../core/constatnts/global_textstyles.dart';
import '../../home_screen/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
      );
    });    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("SHOP HERE",style: GLTextStyles.splashText,)),
    );
  }
}
