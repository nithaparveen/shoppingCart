import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../../core/constatnts/colors.dart';
import '../../core/constatnts/global_textstyles.dart';
import '../../presentation/cart_screen/view/cart_screen.dart';

class GLAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final TextStyle? titleTextStyle;

  const GLAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!, style: GLTextStyles.title),
      titleTextStyle: GLTextStyles.title,
      centerTitle: true,
      backgroundColor: ColorTheme.white,
      surfaceTintColor: ColorTheme.white,
      leading: leading,
      actions: [
        badges.Badge(position: badges.BadgePosition.topEnd(top: 1,end: 1),
          badgeContent: Text("0", style : TextStyle(color: Colors.white)),
          child: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen(itemNames: [], itemPrices: [], itemImages: [],)));
                },
                icon: Icon(Icons.shopping_cart)),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
