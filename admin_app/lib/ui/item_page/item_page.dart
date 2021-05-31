import 'package:admin_app/classes/dish.dart';
import 'package:admin_app/responsive_size.dart';
import 'package:flutter/material.dart';

import 'widgets/pop_back_button.dart';

import 'widgets/description.dart';
import 'widgets/dish_card.dart';
import 'widgets/dish_name.dart';
import 'widgets/dish_subtitle.dart';
import 'widgets/navbar.dart';

class ItemPage extends StatelessWidget {
  final Dish dish;

  ItemPage({@required this.dish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 88,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    right: ResponsiveSize.responsiveWidth(24, context),
                    left: ResponsiveSize.responsiveWidth(24, context),
                    top: ResponsiveSize.responsiveHeight(45, context),
                    bottom: ResponsiveSize.responsiveHeight(30, context),
                  ),
                  child: PopBackButton(),
                ),
                Container(
                  height: ResponsiveSize.responsiveHeight(536, context),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: ResponsiveSize.responsiveWidth(24, context),
                            left: ResponsiveSize.responsiveWidth(24, context),
                            bottom:
                                ResponsiveSize.responsiveHeight(20, context),
                          ),
                          child: Column(
                            children: <Widget>[
                              DishName(title: dish.name),
                              SizedBox(
                                height:
                                    ResponsiveSize.responsiveHeight(8, context),
                              ),
                              DishSubtitle(subtitle: dish.subName),
                            ],
                          ),
                        ),
                        DishCard(
                          price: dish.price,
                          image: dish.image,
                        ),
                        SizedBox(
                          height: ResponsiveSize.responsiveHeight(24, context),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child:
                              Description(dish.description)
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 12,
            child: Navbar(dish),
          ),
        ],
      ),
    );
  }
}
