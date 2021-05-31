import 'package:admin_app/responsive_size.dart';
import 'package:flutter/material.dart';

class NavbarActionButton extends StatelessWidget {
  final Color color;
  final VoidCallback action;
  final bool isIcon;
  final IconData icon;
  final String text;
  final Color childColor;

  NavbarActionButton({
    this.color,
    @required this.action,
    @required this.isIcon,
    this.icon,
    this.childColor,
    this.text,
  }) : assert(isIcon
            ? text == null && icon != null
            : icon == null && text != null);
  @override
  Widget build(BuildContext context) {
    var content = isIcon
        ? Icon(
            icon,
            color: childColor,
            size: ResponsiveSize.responsiveHeight(25, context),
          )
        : Text(
            text,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              color: childColor,
              fontSize: ResponsiveSize.responsiveHeight(24, context),
            ),
          );
    return GestureDetector(
      onTap: action,
      child: Container(
        alignment: Alignment.center,
        height: ResponsiveSize.responsiveHeight(40, context),
        width: ResponsiveSize.responsiveHeight(40, context),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: content,
      ),
    );
  }
}
