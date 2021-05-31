import 'package:admin_app/responsive_size.dart';
import 'package:flutter/material.dart';

class AddNavbarImageIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: ResponsiveSize.responsiveHeight(40, context),
        width: ResponsiveSize.responsiveWidth(54, context),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Icon(
            Icons.image,
            color: Colors.white,
            size: ResponsiveSize.responsiveHeight(26, context),
          ),
        ),
      ),
    );
  }
}
