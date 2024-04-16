import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopping_cart/repository/api/category_screen/model/category_screen_model.dart';
import 'package:shopping_cart/repository/api/common_model/home_screen_model.dart';

import '../../../core/utils/app_utils.dart';
import '../../../repository/api/category_screen/service/category_screen_service.dart';

class CategoryController with ChangeNotifier {
 HomeScreenModel categoryModel = HomeScreenModel();
  List<String> categoryList = [
    "Electronics",
    "Jewelery",
    "Men's clothing",
    "Women's clothing"
  ];
  bool isLoading = false;
  String category = "electronics";

  onTap({required int index,required BuildContext context}) {
    category = categoryList[index].toLowerCase();
    fetchData(context);
    log("tapped category -> $category");
    notifyListeners();
  }

  fetchData(context) {
    isLoading = true;
  notifyListeners();
  log("CategoryController -> fetchData");
  CategoryScreenService.fetchData(category).then((value) {
    log("CategoryScreenService.fetchData() started");
      if(value["status"]==1){
        log("data==== ->${value["data"]}");
        categoryModel = HomeScreenModel.fromJson(value);
        isLoading = false;
      }else{
        AppUtils.oneTimeSnackBar("error", context: context);
      }
    notifyListeners();
  });}
}