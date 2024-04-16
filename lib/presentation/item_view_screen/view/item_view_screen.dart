import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:news_app_with_api/controller/home-screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/presentation/cart_screen/view/cart_screen.dart';

import '../../../core/constatnts/colors.dart';
import '../../../core/constatnts/global_textstyles.dart';
import '../../../global_widget/appbar_global/appbar_global.dart';

class ItemViewScreen extends StatefulWidget {
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
  State<ItemViewScreen> createState() => _ItemViewScreenState();
}

class _ItemViewScreenState extends State<ItemViewScreen> {

  int _cartCount = 0;
  List<String> _cartItemNames = [];
  List<String> _cartItemPrices = [];
  List<String> _cartItemImages = [];

  void addToCart(String itemName, String itemPrice, String itemImage) {
    setState(() {
      _cartItemNames.add(itemName);
      _cartItemPrices.add(itemPrice);
      _cartItemImages.add(itemImage);
      _cartCount = _cartItemNames.length; // Update _cartCount
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GLAppBar(
        title: "",
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    height: 250,
                    width: 200,
                    child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.imageUrl!))),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${widget.title}",
                style: GLTextStyles.titleTextBlk,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${widget.description}",
                style: GLTextStyles.labeltxtBlk16,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Price : ${widget.price}",
                style: GLTextStyles.titleblack18,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    " ★  ${widget.rating}",
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
                  onPressed: () {
                    addToCart(widget.title, widget.price.toString(), widget.imageUrl.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          itemNames: _cartItemNames,
                          itemPrices: _cartItemPrices,
                          itemImages: _cartItemImages,
                        ),
                      ),
                    );
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
