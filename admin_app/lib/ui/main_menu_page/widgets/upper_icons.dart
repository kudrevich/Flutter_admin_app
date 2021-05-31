import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/chat/chat.dart';
import 'package:admin_app/ui/clients_chats_page/clients_chats_page.dart';
import 'package:admin_app/ui/settings_page/settings_page.dart';
import 'package:flutter/material.dart';

class UpperIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: ResponsiveSize.responsiveWidth(24, context),
        right: ResponsiveSize.responsiveWidth(24, context),
        top: ResponsiveSize.responsiveHeight(10, context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              Scaffold.of(context).removeCurrentSnackBar();
              FocusScope.of(context).unfocus();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ClientsChatsPage(),
                ),
              );
            },
            child: Container(
              height: ResponsiveSize.responsiveHeight(40, context),
              width: ResponsiveSize.responsiveHeight(40, context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFD3DADD),
                  width: 0.5,
                ),
              ),
              child: Icon(
                Icons.message,
                size: ResponsiveSize.responsiveHeight(19, context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              FocusScope.of(context).unfocus();
              Scaffold.of(context).removeCurrentSnackBar();
              await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SettingsPage()));
            },
            child: Container(
              height: ResponsiveSize.responsiveHeight(40, context),
              width: ResponsiveSize.responsiveWidth(54, context),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.settings, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
