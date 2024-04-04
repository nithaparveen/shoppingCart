import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:news_app_with_api/controller/home-screen_controller.dart';
import 'package:shopping_cart/core/constatnts/global_textstyles.dart';


class CartItemCard extends StatelessWidget {
  CartItemCard({
    super.key,
    this.id,
    this.userId,
    required this.date,
    this.v,
    required this.size,
    this.productId,
    this.quantity,
  });

  final int? id;
  final int? userId;
  final String? date;
  final String? productId;
  final int? quantity;
  final int? v;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date != null
                ? DateFormat("yyyy-mm-dd")
                    .format(DateTime.parse(date.toString()))
                : "",
            style: GLTextStyles.labeltxtBlk16,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white24,
                border: Border.all(width: 0.5)),
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$productId",
                  style: GLTextStyles.titleblack18,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                ),
                Text(
                  "$quantity",
                  style: GLTextStyles.titleblack18,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
