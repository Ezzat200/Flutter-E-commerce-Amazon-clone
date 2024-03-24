
import 'package:amazon_clone/view/seller/inventory/inventory_screen.dart';
import 'package:amazon_clone/view/seller/monitor/monitor_Screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SellerBootomNavBar extends StatefulWidget {
  const SellerBootomNavBar({super.key});

  @override
  State<SellerBootomNavBar> createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<SellerBootomNavBar> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  
  List<Widget>_buildScreens(){
    return [
const InventoryScreen(),
const MonitorScreen(),

    ];
  }


  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.inventory_2_outlined),
            title: "Inventory",
            activeColorPrimary: Colors.teal,
            inactiveColorPrimary: Colors.black,
            ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.bar_chart_outlined),
          title: "Monitor",
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.black,
         
        ),
      
      ];
  @override

  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}