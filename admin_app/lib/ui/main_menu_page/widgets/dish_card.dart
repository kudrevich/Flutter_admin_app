import 'package:admin_app/classes/dish.dart';
import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/item_edit_page/item_edit_page.dart';
import 'package:admin_app/ui/item_page/item_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DishCard extends StatelessWidget {
  final Dish dish;

  DishCard({this.dish});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemPage(dish: dish),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          right: ResponsiveSize.responsiveWidth(24, context),
          left: ResponsiveSize.responsiveWidth(56, context),
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: ResponsiveSize.responsiveHeight(18, context)),
              width: ResponsiveSize.responsiveWidth(280, context),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: ResponsiveSize.responsiveWidth(64, context),
                  ),
                  Container(
                    width: ResponsiveSize.responsiveWidth(216, context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            right: ResponsiveSize.responsiveWidth(10, context),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dish.name,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ResponsiveSize.responsiveHeight(
                                      15, context),
                                ),
                              ),
                              SizedBox(
                                height:
                                    ResponsiveSize.responsiveHeight(6, context),
                              ),
                              Text(
                                dish.subName,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .color,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .fontFamily,
                                  fontSize: ResponsiveSize.responsiveHeight(
                                      12, context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ResponsiveSize.responsiveHeight(16, context),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${dish.price} ₽",
                              style: GoogleFonts.roboto(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fontSize: ResponsiveSize.responsiveHeight(
                                    18, context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ItemEditPage(
                                          dish: dish,
                                        )));
                              },
                              child: Container(
                                height: ResponsiveSize.responsiveHeight(
                                    40, context),
                                width:
                                    ResponsiveSize.responsiveWidth(56, context),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Theme.of(context).accentColor,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: ResponsiveSize.responsiveHeight(
                                        24, context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: -ResponsiveSize.responsiveWidth(25, context),
              child: ClipOval(
                child: Container(
                  width: ResponsiveSize.responsiveHeight(70, context),
                  height: ResponsiveSize.responsiveHeight(70, context),
                  child: Image(
                    fit: BoxFit.cover,
                    image: ResizeImage(
                      dish.image,
                      width:
                          ResponsiveSize.responsiveWidth(200, context).round(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
