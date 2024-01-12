import 'package:budget_buddy/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: color,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(const IconData(0xe3f8, fontFamily: 'MaterialIcons')),
      title: ("Income"),
      activeColorPrimary: color,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.money_rubl),
      title: ("expense"),
      activeColorPrimary: color,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
