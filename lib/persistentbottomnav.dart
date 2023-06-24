import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:soft_kernal/badge_count.dart';

import 'nav_screen.dart';

class PersistentBottomNav extends StatefulWidget {
  const PersistentBottomNav({super.key});

  @override
  State<PersistentBottomNav> createState() => _PersistentBottomNavState();
}

class _PersistentBottomNavState extends State<PersistentBottomNav> {
  BadgeCount notificationBadgeCount = BadgeCount();
  BadgeCount cartBadgeCount = BadgeCount();
  BadgeCount favBadgeCount = BadgeCount();
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  notifIncreament() {
    setState(() {
      notificationBadgeCount.increaseCount();
    });
  }

  notifDecrement() {
    setState(() {
      notificationBadgeCount.decreaseCount();
    });
  }

  cartIncreament() {
    setState(() {
      cartBadgeCount.increaseCount();
    });
  }

  cartDecrement() {
    setState(() {
      cartBadgeCount.decreaseCount();
    });
  }

  favIncreament() {
    setState(() {
      favBadgeCount.increaseCount();
    });
  }

  favDecrement() {
    setState(() {
      favBadgeCount.decreaseCount();
    });
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Badge(
          label: Text(cartBadgeCount.count.toString()),
          child: Icon(Icons.shopping_cart),
        ),
        title: "Cart",
        activeColorPrimary: Color(0xFF0061A4),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Badge(
          label: Text(favBadgeCount.count.toString()),
          child: Icon(Icons.favorite),
        ),
        title: "Favorites",
        activeColorPrimary: Color(0xFF0061A4),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Badge(
          label: Text(notificationBadgeCount.count.toString()),
          child: Icon(Icons.notifications),
        ),
        title: "Notifications",
        activeColorPrimary: Color(0xFF0061A4),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: [
        TabScreen(
          initialCount: 0,
          title: "Cart",
          increament: cartIncreament,
          decrement: cartDecrement,
        ),
        TabScreen(
          initialCount: 0,
          title: "Favorites",
          increament: favIncreament,
          decrement: favDecrement,
        ),
        TabScreen(
          initialCount: 0,
          title: "Notification",
          increament: notifIncreament,
          decrement: notifDecrement,
        ),
      ],
      items: _navBarItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style6,
    );
  }
}
