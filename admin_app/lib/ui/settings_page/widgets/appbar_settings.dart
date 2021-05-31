import 'package:admin_app/UI/item_page/widgets/pop_back_button.dart';
import 'package:admin_app/responsive_size.dart';
import 'package:flutter/material.dart';

class AppbarSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ResponsiveSize.responsiveHeight(15, context),
        left: ResponsiveSize.responsiveWidth(24, context),
      ),
      child: Row(
        children: [
          PopBackButton(),
          SizedBox(
            width: ResponsiveSize.responsiveWidth(7, context),
          ),
          Container(
            width: ResponsiveSize.responsiveWidth(219, context),
            height: ResponsiveSize.responsiveHeight(25, context),
            alignment: Alignment.center,
            child: Text(
              "Настройки",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                fontSize: ResponsiveSize.responsiveHeight(21, context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
