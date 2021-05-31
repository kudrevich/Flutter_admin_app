import 'package:admin_app/classes/dish.dart';
import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/item_edit_page/item_edit_page.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final Dish dish;

  Navbar(this.dish);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ResponsiveSize.responsiveWidth(25, context),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ItemEditPage(
                  dish: dish,
                ),
              ),
            );
          },
          child: Container(
            width: ResponsiveSize.responsiveWidth(220, context),
            height: ResponsiveSize.responsiveHeight(52, context),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Редактировать',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: ResponsiveSize.responsiveHeight(18, context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
