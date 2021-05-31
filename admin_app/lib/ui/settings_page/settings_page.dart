import 'package:admin_app/responsive_size.dart';
import 'package:admin_app/ui/settings_page/widgets/appbar_settings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: ResponsiveSize.responsiveHeight(22, context)
        ),
        child: AppbarSettings(),
      ),
    );
  }
}
