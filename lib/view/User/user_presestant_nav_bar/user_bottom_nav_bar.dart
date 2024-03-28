import 'package:amazon_clone/view/User/Cart/CartScreen.dart';
import 'package:amazon_clone/view/User/Home/Home_Screen.dart';
import 'package:amazon_clone/view/User/Menu/MenueScreen.dart';
import 'package:amazon_clone/view/User/Profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class UserBottomNavBar extends StatefulWidget {
  const UserBottomNavBar({super.key});

  @override
  State<UserBottomNavBar> createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<UserBottomNavBar> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  
  List<Widget>_buildScreens(){
    return [
const HomeScreen(),
const ProfileScreen(),
const CartScreen(),
const MenueScreen()
    ];
  }


  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: "Home",
            activeColorPrimary: Colors.teal,
            inactiveColorPrimary: Colors.black,
            ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_outlined),
          title: "You",
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.black,
         
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart_outlined),
          title: "Cart",
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.black,
        
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.menu),
          title: "Menu",
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