import 'package:admin_app/classes/dish_category.dart';
import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/item_add_page/item_add_page.dart';
import 'package:admin_app/ui/item_add_page/widgets/add_select_category_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddSelectCategory extends StatefulWidget {
  @override
  _AddSelectCategoryState createState() => _AddSelectCategoryState();
}

class _AddSelectCategoryState extends State<AddSelectCategory> {
  int selected = 0;
  List<DishCategory> categoryList = [
    DishCategory(icon: FontAwesomeIcons.hamburger, name: "Бургеры"),
    DishCategory(icon: FontAwesomeIcons.pepperHot, name: "Острое"),
    DishCategory(icon: FontAwesomeIcons.candyCane, name: "Десерты"),
    DishCategory(icon: FontAwesomeIcons.child, name: "Детское меню"),
    DishCategory(icon: FontAwesomeIcons.coffee, name: "Напитки"),
    DishCategory(icon: FontAwesomeIcons.fish, name: "Рыба"),
  ];

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.only(
          right: ResponsiveSize.responsiveWidth(10, context),
        ),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        duration: _expanded
            ? Duration(milliseconds: 300)
            : Duration(milliseconds: 100),
        height: _expanded
            ? ResponsiveSize.responsiveHeight(200, context)
            : ResponsiveSize.responsiveHeight(40, context),
        width: ResponsiveSize.responsiveWidth(180, context),
        child: _expanded
            ? ListView.separated(
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  var item = AddSelectCategoryItem(
                    data: categoryList[index],
                    onTap: () {
                      ItemAddPage.currentCategory = index;
                      selected = index;
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                  );
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: ResponsiveSize.responsiveHeight(7, context),
                      ),
                      child: item,
                    );
                  }
                  if (index == categoryList.length - 1) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: ResponsiveSize.responsiveHeight(7, context),
                      ),
                      child: item,
                    );
                  } else
                    return item;
                },
                separatorBuilder: (_, index) {
                  return Divider();
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AddSelectCategoryItem(
                    data: categoryList[selected],
                  ),
                  Icon(
                    Icons.expand_less,
                    size: ResponsiveSize.responsiveHeight(21, context),
                    color: Theme.of(context).textTheme.bodyText2.color,
                  ),
                ],
              ),
      ),
    );
  }
}
