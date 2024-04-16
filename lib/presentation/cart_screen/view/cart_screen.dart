//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shopping_cart/core/constatnts/global_textstyles.dart';
// import 'package:shopping_cart/presentation/cart_screen/widgets/cart_item_card/cart_item_card_screen.dart';
//
// import '../controller/cart_controller.dart';
//
// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   fetchData() {
//     Provider.of<CartController>(context, listen: false).fetchData(context);
//   }
//
//   @override
//   void initState() {
//     fetchData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Your Cart",
//           style: GLTextStyles.title,
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<CartController>(builder: (context, scontrol, child) {
//         return scontrol.isLoading == true
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             :ListView.builder(
//                 itemCount: scontrol.cartModel.data?.length,
//                 itemBuilder: (context, index) {
//                   print(scontrol.cartModel.data?.length);
//                   var addindex = scontrol.cartModel.data?[index].products?.length;
//                   print("add ${index} : $addindex");
//                   return SizedBox(
//                        height: size.height * .2,
//                       child: Column(children: [
//                     ListView.builder(
//                       itemBuilder: (context, index) {
//                         return  CartItemCard(
//                               date: scontrol.cartModel.data?[index].date.toString(),
//                                productId: scontrol.cartModel.data?[index].products?[0].productId.toString(),
//                                quantity: scontrol.cartModel.data?[index].products?[0].quantity?.toInt(),
//                               size: size,
//                             );
//                       },
//                     )
//                   ])
//                       //     CartItemCard(
//                       //   date: scontrol.cartModel.data?[index].date.toString(),
//                       //    productId: scontrol.cartModel.data?[index].products?[0].productId,
//                       //    quantity: scontrol.cartModel.data?[index].products?[0].quantity?.toInt(),
//                       //   size: size,
//                       // )
//                       );
//                 });
//
//       }),
//     );
//   }
// }
import 'package:flutter/material.dart';
class CartScreen extends StatefulWidget {
  final List<String> itemNames;
  final List<String> itemPrices;
  final List<String> itemImages;
  // final Function(int) removeFromCart;

  CartScreen({
    required this.itemNames,
    required this.itemPrices,
    required this.itemImages,
    // required this.removeFromCart,
  });

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart',style:TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.itemNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(widget.itemImages[index]),
            title: Text(widget.itemNames[index]),
            subtitle: Text('\$${widget.itemPrices[index]}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // setState(() {
                //   widget.removeFromCart(index);
                // });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total:',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
              ),
              Text(
                '\$${calculateTotal(widget.itemPrices)}',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            widget.itemNames.clear();
            widget.itemPrices.clear();
            widget.itemImages.clear();
          });
        },
        label: Text('Delete All'),
        icon: Icon(Icons.delete_forever),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  String calculateTotal(List<String> prices) {
    double total = 0;
    for (var price in prices) {
      total += double.parse(price);
    }
    return total.toStringAsFixed(2);
  }
}
