import 'dart:ui';

import 'package:admin_app/classes/dish_category.dart';
import 'package:admin_app/responsive_size.dart';
import 'package:flutter/material.dart';

class AddSelectCategoryItem extends StatelessWidget {
  AddSelectCategoryItem({this.data, this.onTap});

  final DishCategory data;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
        ),
        padding: EdgeInsets.only(
          left: ResponsiveSize.responsiveWidth(5, context),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              data.icon,
              size: ResponsiveSize.responsiveHeight(25.9, context),
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
            SizedBox(
              width: ResponsiveSize.responsiveWidth(15, context),
            ),
            Container(
              // color: Colors.deepOrangeAccent,
              width: ResponsiveSize.responsiveWidth(95, context),
              child: Text(
                data.name,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontSize: ResponsiveSize.responsiveHeight(15, context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
