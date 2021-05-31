import 'package:admin_app/responsive_size.dart';
import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  final TextEditingController descriptionController;

  DescriptionTextField({@required this.descriptionController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Описание',
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
            color: Theme.of(context).textTheme.bodyText1.color,
            fontSize: ResponsiveSize.responsiveHeight(18,context),
          ),
        ),
        SizedBox(
          height: ResponsiveSize.responsiveHeight(8,context),
        ),
        Container(
          height: ResponsiveSize.responsiveHeight(157,context),
          width: ResponsiveSize.responsiveWidth(312,context),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Container(
            alignment: Alignment.topLeft,
            child: TextFormField(
              textInputAction: TextInputAction.newline,
              textCapitalization: TextCapitalization.sentences,
              controller: descriptionController,
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                color: Theme.of(context).textTheme.bodyText1.color,
                fontSize: ResponsiveSize.responsiveHeight(16,context),
              ),
            ),
          ),
        )
      ],
    );
  }
}
