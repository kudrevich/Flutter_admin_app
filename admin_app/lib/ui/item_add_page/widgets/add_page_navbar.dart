import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/item_edit_page/item_edit_page.dart';
import 'package:admin_app/ui/item_edit_page/widgets/navbar_bookmark_icon.dart';
import 'package:admin_app/ui/item_edit_page/widgets/navbar_image_icon.dart';
import 'package:admin_app/classes/dish.dart';
import 'package:flutter/material.dart';

class AddPageNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveSize.responsiveHeight(88, context),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(163, 174, 179, 0.25),
            offset: Offset(0, 4),
            blurRadius: 40,
          ),
        ],
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
        left: ResponsiveSize.responsiveWidth(25, context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavbarImageIcon(),
          SizedBox(
            width: ResponsiveSize.responsiveWidth(5, context),
          ),
          NavbarBookmarkIcon(),
          SizedBox(),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: ResponsiveSize.responsiveWidth(180, context),
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
                  'Готово',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveSize.responsiveWidth(18, context),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
