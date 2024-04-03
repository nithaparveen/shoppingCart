import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

// import 'package:news_app_with_api/controller/home-screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/core/constatnts/global_textstyles.dart';
import 'package:shopping_cart/presentation/home_screen/widgets/item_view_screen.dart';
import 'package:shopping_cart/repository/api/common_model/home_screen_model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.size,
  });

  final String? title;
  final double? price;
  final String? imageUrl;
  final double? rating;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: Colors.white24,border: Border.all(width: 0.5)),
      margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
      padding: EdgeInsets.only(left: 10),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(height:150,width:90,child: Image(image: NetworkImage(imageUrl!))),
            ],
          ),
          SizedBox(width: 15,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title",
                  style: GLTextStyles.titleTextBlk,
                  overflow: TextOverflow.ellipsis,
                   maxLines: 4,
                ),
                SizedBox(height: 8,),
                Text(
                  "Price : $price",
                  style: GLTextStyles.subtitleBlk14,
                ),
                Text(
                  " ★  $rating",
                  style: GLTextStyles.subtitleBlk14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
