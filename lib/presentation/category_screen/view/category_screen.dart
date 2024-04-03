import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/presentation/item_view_screen/view/item_view_screen.dart';

import '../../../core/constatnts/colors.dart';
import '../../../core/constatnts/global_textstyles.dart';
import '../../home_screen/widgets/item_card.dart';
import '../controller/category_controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  fetchData(){
    Provider.of<CategoryController>(context,listen: false).fetchData(context);
  }
  @override
  void initState() {
    fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    CategoryController provider = Provider.of<CategoryController>(context);
    var size = MediaQuery.of(context).size;

    return Consumer<CategoryController>(builder: (context, ccontrol, _) {
      return DefaultTabController(
        length: ccontrol.categoryList.length,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              "SHOP",
              // style: GLTextStyles.titleTextBlk25,
            ),
            bottom: TabBar(
              tabAlignment: TabAlignment.start,
              labelStyle: TextStyle(
                  color: ColorTheme.mainClr, fontWeight: FontWeight.w400),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
              unselectedLabelStyle: TextStyle(
                  color: ColorTheme.mainClr,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: ColorTheme.mainClr,
                  borderRadius: BorderRadius.circular(10)),
              isScrollable: true,
              tabs: List.generate(
                provider.categoryList.length,
                (index) => Tab(
                  text: provider.categoryList[index],
                ),
              ),
              onTap: (value) {
                provider.onTap(index: value, context: context);
              },
            ),
          ),
          body: ccontrol.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    itemCount: ccontrol.categoryModel.data?.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        // height: size.height * .2,
                        child: InkWell(
                          onTap: () {
                            log("tapped");
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemViewScreen(
                                title: ccontrol.categoryModel.data?[index].title ?? "",
                                price: ccontrol.categoryModel.data?[index].price ?? 0,
                                description: ccontrol.categoryModel.data?[index].description ?? "",
                                category: ccontrol.categoryModel.data?[index].category.toString() ?? "",
                                imageUrl: ccontrol.categoryModel.data?[index].image ?? "",
                                rating: ccontrol.categoryModel.data?[index].rating?.rate,)));
                          },
                          child: ItemCard(
                              title:
                                  ccontrol.categoryModel.data?[index].title ?? "",
                              price: ccontrol.categoryModel.data?[index].price ?? 0,
                              imageUrl:
                                  ccontrol.categoryModel.data?[index].image ?? "",
                              rating:
                                  ccontrol.categoryModel.data?[index].rating?.rate,
                              size: size),
                        ),
                      );
                    }),
              ),
        ),
      );
    });
  }
}
