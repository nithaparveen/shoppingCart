import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shopping_cart/core/utils/app_utils.dart';
import 'package:shopping_cart/repository/api/home_screen/model/home_screen_model.dart';
import 'package:shopping_cart/repository/api/home_screen/service/home_screen_service.dart';

class HomeScreenController extends ChangeNotifier {
  List <HomeScreenModel> datas=[];
  HomeScreenModel homeScreenModel = HomeScreenModel();
  bool isLoading = false;

  fetchData(context) async {
    isLoading = true;
    notifyListeners();
    log("HomeScreenController -> fetchData");
    HomeScreenService.fetchData().then((value) {
      log("HomeScreenService.fetchData() started");
      if (value["status"] == 1) {
        log("data==== ->${value["data"]}");
        homeScreenModel = HomeScreenModel.fromJson(value);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }
}
