import 'package:admin_app/responsive_size.dart';
import 'package:flutter/material.dart';

class AddTitleBlockTextField extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController subtitleController;

  AddTitleBlockTextField(
      {@required this.titleController, @required this.subtitleController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ResponsiveSize.responsiveHeight(32, context),
          width: ResponsiveSize.responsiveWidth(273, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          child: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            controller: titleController,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: ResponsiveSize.responsiveHeight(21, context),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding:
                  EdgeInsets.only(top: ResponsiveSize.responsiveHeight(5, context)),
            ),
          ),
        ),
        SizedBox(
          height: ResponsiveSize.responsiveHeight(5, context),
        ),
        Container(
          height: ResponsiveSize.responsiveHeight(21, context),
          width: ResponsiveSize.responsiveWidth(220, context),
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveSize.responsiveWidth(10, context),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            controller: subtitleController,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveSize.responsiveHeight(16, context),
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding:
                  EdgeInsets.only(top: ResponsiveSize.responsiveHeight(1, context)),
            ),
          ),
        ),
      ],
    );
  }
}
