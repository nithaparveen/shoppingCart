import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:news_app_with_api/controller/home-screen_controller.dart';
import 'package:provider/provider.dart';

import '../../../core/constatnts/colors.dart';
import '../../../core/constatnts/global_textstyles.dart';

class ItemViewScreen extends StatelessWidget {
  const ItemViewScreen({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });

  final String title;
  final double? price;
  final String? description;
  final String? category;
  final String? imageUrl;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_rounded,color: Colors.black,size: 25,) ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff6A3DE8), size: 30),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child:Container(
                    height: 250,
                    width: 200,
                    child: Image(fit:BoxFit.fill,image: NetworkImage(imageUrl!))),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "$title",
                style: GLTextStyles.titleTextBlk,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "$description",
                style: GLTextStyles.labeltxtBlk16,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Price : $price",
                style: GLTextStyles.titleblack18,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    " ★  $rating",
                    style: GLTextStyles.titleblack18,
                  ),
                ],
              ),
              Center(
                child: MaterialButton(
                    color: ColorTheme.mainClr,
                    child: Text(
                      "Add to Cart",
                      style: GLTextStyles.subtitleWhite,
                    ),
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
