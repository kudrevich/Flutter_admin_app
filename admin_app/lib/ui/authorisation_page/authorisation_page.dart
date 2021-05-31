import 'package:admin_app/ui/authorisation_page/widgets/auth_text_field.dart';
import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/main_menu_page/main_menu_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthorisationPage extends StatelessWidget {
  final TextEditingController loginController = new TextEditingController();
  final TextEditingController pswdController = new TextEditingController();

  AuthorisationPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ResponsiveSize.responsiveHeight(80, context),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/mealtime.png",
                    height: ResponsiveSize.responsiveHeight(150, context),
                    width: ResponsiveSize.responsiveHeight(150, context),
                  ),
                ),
                SizedBox(
                  height: ResponsiveSize.responsiveHeight(90, context),
                ),
                AuthTextField(loginController, pswdController),
                SizedBox(
                  height: ResponsiveSize.responsiveHeight(80, context),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => MainMenuPage()),
                      (r) => false,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: ResponsiveSize.responsiveHeight(25, context),
                    ),
                    width: ResponsiveSize.responsiveWidth(212, context),
                    height: ResponsiveSize.responsiveHeight(52, context),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Войти',
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.bodyText1.fontFamily,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize: ResponsiveSize.responsiveWidth(18, context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
