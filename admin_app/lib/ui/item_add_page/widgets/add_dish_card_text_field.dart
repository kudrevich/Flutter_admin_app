import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/item_edit_page/widgets/select_category.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddDishCardTextField extends StatelessWidget {
  final TextEditingController price;

  AddDishCardTextField({
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveSize.responsiveWidth(312, context),
      height: ResponsiveSize.responsiveHeight(380, context),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: ResponsiveSize.responsiveHeight(281, context),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/Frame_73.png")
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveSize.responsiveHeight(20, context),
              horizontal: ResponsiveSize.responsiveWidth(20, context),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Цена: ',
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily,
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: ResponsiveSize.responsiveHeight(16, context),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: ResponsiveSize.responsiveWidth(12, context),
                      ),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      width: ResponsiveSize.responsiveWidth(101, context),
                      height: ResponsiveSize.responsiveHeight(27, context),
                      child: TextFormField(
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.only(
                              bottom:
                                  ResponsiveSize.responsiveHeight(1, context)),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: price,
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.bodyText1.fontFamily,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize:
                              ResponsiveSize.responsiveHeight(21, context),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveSize.responsiveHeight(20, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Категория: ',
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily,
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: ResponsiveSize.responsiveHeight(16, context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: ResponsiveSize.responsiveWidth(19, context),
            bottom: ResponsiveSize.responsiveHeight(12, context),
            child: SelectCategory(),
          ),
        ],
      ),
    );
  }
}
