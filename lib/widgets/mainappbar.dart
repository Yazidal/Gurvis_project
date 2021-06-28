import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/appcolors.dart';
import 'package:flutter_application_1/helpers/iconhelper.dart';
import 'package:flutter_application_1/helpers/utils.dart';

import 'iconfont.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  Color themeColor;

  MainAppBar({
    this.themeColor = AppColors.MAIN_COLOR,
  });

  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(80);
}

class MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          Utils.mainAppNav.currentState!
              .popUntil((route) => route.settings.name == '/mainpage');
        },
        child: Center(
          child: IconFont(
              iconName: IconFontHelper.LOGO,
              color: widget.themeColor,
              size: 40),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: widget.themeColor),
    );
  }
}
