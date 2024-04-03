import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/core/constatnts/global_textstyles.dart';
import 'package:shopping_cart/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:shopping_cart/presentation/home_screen/widgets/item_card.dart';

import '../../item_view_screen/view/item_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  fetchData() {
    Provider.of<HomeScreenController>(context, listen: false)
        .fetchData(context);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "SHOP",
          // style: GLTextStyles.titleTextBlk25,
        ),
      ),
      body: Consumer<HomeScreenController>(builder: (context, hcontrol, child) {
        return hcontrol.isLoading==true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: hcontrol.homeScreenModel.data?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    // height: size.height * .2,
                    child: InkWell(
                      onTap: () {
                        log("tapped");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemViewScreen(
                          title: hcontrol.homeScreenModel.data?[index].title ?? "",
                          price: hcontrol.homeScreenModel.data?[index].price ?? 0,
                          description: hcontrol.homeScreenModel.data?[index].description ?? "",
                          category: hcontrol.homeScreenModel.data?[index].category.toString() ?? "",
                          imageUrl: hcontrol.homeScreenModel.data?[index].image ?? "",
                          rating: hcontrol.homeScreenModel.data?[index].rating?.rate,)));
                      },
                      child: ItemCard(
                          title: hcontrol.homeScreenModel.data?[index].title??"",
                          price: hcontrol.homeScreenModel.data?[index].price??0,
                          imageUrl: hcontrol.homeScreenModel.data?[index].image??"",
                          rating: hcontrol.homeScreenModel.data![index].rating?.rate,
                          size: size),
                    ),
                  );
                });
      }),
    );
  }
}
