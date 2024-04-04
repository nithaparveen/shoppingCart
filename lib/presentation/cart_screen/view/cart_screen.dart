
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/core/constatnts/global_textstyles.dart';
import 'package:shopping_cart/presentation/cart_screen/widgets/cart_item_card/cart_item_card_screen.dart';

import '../controller/cart_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  fetchData() {
    Provider.of<CartController>(context, listen: false).fetchData(context);
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
        title: Text(
          "Your Cart",
          style: GLTextStyles.title,
        ),
        centerTitle: true,
      ),
      body: Consumer<CartController>(builder: (context, scontrol, child) {
        return scontrol.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            :ListView.builder(
                itemCount: scontrol.cartModel.data?.length,
                itemBuilder: (context, index) {
                  print(scontrol.cartModel.data?.length);
                  var addindex = scontrol.cartModel.data?[index].products?.length;
                  print("add ${index} : $addindex");
                  return SizedBox(
                       height: size.height * .2,
                      child: Column(children: [
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return  CartItemCard(
                              date: scontrol.cartModel.data?[index].date.toString(),
                               productId: scontrol.cartModel.data?[index].products?[0].productId.toString(),
                               quantity: scontrol.cartModel.data?[index].products?[0].quantity?.toInt(),
                              size: size,
                            );
                      },
                    )
                  ])
                      //     CartItemCard(
                      //   date: scontrol.cartModel.data?[index].date.toString(),
                      //    productId: scontrol.cartModel.data?[index].products?[0].productId,
                      //    quantity: scontrol.cartModel.data?[index].products?[0].quantity?.toInt(),
                      //   size: size,
                      // )
                      );
                });
        
      }),
    );
  }
}
