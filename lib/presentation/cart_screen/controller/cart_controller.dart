import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopping_cart/repository/api/cart_screen/model/cart_model.dart';
import 'package:shopping_cart/repository/api/cart_screen/service/cart_service.dart';

import '../../../core/utils/app_utils.dart';

class CartController with ChangeNotifier {
  bool isLoading = false;
  CartModel cartModel = CartModel();

  fetchData(context) {
    isLoading = true;
    notifyListeners();
    log("CartController -> fetchData");
    CartService.fetchData().then((value) {
      log("CartService.fetchData() started");
      if (value["status"] == 1) {
        log("data==== ->${value["data"]}");
        cartModel = CartModel.fromJson(value);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }
}
