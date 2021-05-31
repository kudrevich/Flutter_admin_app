import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/item_page/widgets/pop_back_button.dart';
import 'package:flutter/material.dart';

class AppbarChat extends StatelessWidget {
  final String phoneNumber;

  const AppbarChat(this.phoneNumber, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ResponsiveSize.responsiveWidth(24, context),
        right: ResponsiveSize.responsiveWidth(27, context),
        bottom: ResponsiveSize.responsiveHeight(15, context),
        top: ResponsiveSize.responsiveHeight(15, context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PopBackButton(),
          Text(
            phoneNumber,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: ResponsiveSize.responsiveHeight(21, context),
            ),
          ),
        ],
      ),
    );
  }
}
