
import 'package:flutter/material.dart';
import 'package:flutterDemos/example_pages/proj_tools/extension_views.dart';
import 'package:flutterDemos/example_pages/proj_tools/extension_string.dart';

class BottomNaviBarItemModel {
  final Icon selectIcon;
  final Icon normalIcon;
  final String selectImageUrl;
  final String normalImageUrl;
  final String title;

  BottomNaviBarItemModel(
      {this.selectIcon,
      this.normalIcon,
      this.selectImageUrl,
      this.normalImageUrl,
      this.title})
      : assert(normalImageUrl != null || normalIcon != null);

  BottomNavigationBarItem createItems() {
    Widget nIcon;
    if (normalImageUrl.lcIsNotEmpty) {
      nIcon = ImageViewLoad.lcNetwork(normalImageUrl);
    } else {
      nIcon = normalIcon;
    }

    Widget sIcon ;
    if (selectImageUrl.lcIsNotEmpty) {
      sIcon = ImageViewLoad.lcNetwork(selectImageUrl);
    } else {
      sIcon = selectIcon;
    }

    return BottomNavigationBarItem(
        icon: nIcon, activeIcon: sIcon, title: Text(title));
  }
}
