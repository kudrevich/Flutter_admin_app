import 'package:admin_app/classes/dish.dart';
import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/item_add_page/widgets/add_description_text_field.dart';
import 'package:admin_app/ui/item_add_page/widgets/add_dish_card_text_field.dart';
import 'package:admin_app/ui/item_add_page/widgets/add_page_navbar.dart';
import 'package:admin_app/ui/item_add_page/widgets/add_title_block_text_field.dart';
import 'package:admin_app/ui/item_page/widgets/pop_back_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemAddPage extends StatefulWidget {
  static int currentCategory;

  @override
  _ItemAddPageState createState() => _ItemAddPageState();
}

class _ItemAddPageState extends State<ItemAddPage> {
  TextEditingController priceController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  TextEditingController subtitleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    priceController.dispose();
    titleController.dispose();
    subtitleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFFEDF0F5),
            body: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    right: ResponsiveSize.responsiveWidth(24, context),
                    left: ResponsiveSize.responsiveWidth(24, context),
                    top: ResponsiveSize.responsiveHeight(10, context),
                    bottom: ResponsiveSize.responsiveHeight(15, context),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: PopBackButton(),
                  ),
                ),
                Expanded(
                  flex: 88,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            right: ResponsiveSize.responsiveWidth(24, context),
                            left: ResponsiveSize.responsiveWidth(24, context),
                            bottom:
                                ResponsiveSize.responsiveHeight(20, context),
                          ),
                          child: AddTitleBlockTextField(
                            titleController: titleController,
                            subtitleController: subtitleController,
                          ),
                        ),
                        AddDishCardTextField(
                          price: priceController,
                        ),
                        SizedBox(
                          height: ResponsiveSize.responsiveHeight(24, context),
                        ),
                        Container(
                          height: ResponsiveSize.responsiveHeight(205, context),
                          padding: EdgeInsets.only(
                            right: ResponsiveSize.responsiveWidth(23, context),
                            left: ResponsiveSize.responsiveWidth(23, context),
                            bottom:
                                ResponsiveSize.responsiveHeight(10, context),
                          ),
                          alignment: Alignment.centerLeft,
                          child: AddDescriptionTextField(
                            descriptionController: descriptionController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AddPageNavbar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
