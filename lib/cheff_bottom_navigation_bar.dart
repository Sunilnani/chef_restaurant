import 'package:cheff_restaurant/home_screens/home_page.dart';
import 'package:cheff_restaurant/home_screens/menu_items_page.dart';
import 'package:cheff_restaurant/home_screens/notifications_page.dart';
import 'package:cheff_restaurant/home_screens/orders_page.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CheffBottomNavigationBar extends StatefulWidget {

  const CheffBottomNavigationBar({this.activeIndex = 0});

  final int activeIndex;

  @override
  _CheffBottomNavigationBarState createState() => _CheffBottomNavigationBarState();
}

class _CheffBottomNavigationBarState extends State<CheffBottomNavigationBar> {




  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final tabs=[
    ChefHomePage(),
    MenuItemsPage(),
    OrdersPage()
    // CheffNotificationsPage(),
  ];
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.activeIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: Material(
        elevation: 20,
        color: Colors.grey,
        child: Container(

          height: 70,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: true,

            showUnselectedLabels: true,
            //unselectedItemColor: Color(0xFFABABAB),
            type: BottomNavigationBarType.fixed,
            items: [

              BottomNavigationBarItem(
                  activeIcon: Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    // width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeConfig.secondaryColor.withOpacity(0.1),

                    ),
                    child: Image.asset("assets/images/select_home.png",color: ThemeConfig.secondaryColor,width: 20,),
                  ),
                  // activeIcon: SizedBox(
                  //     height: 40,
                  //     child: Image.asset("assets/images/home f.png",width: 24,color: ThemeConfig.primary,)),
                  icon: SizedBox(
                    height: 40,
                    child: Image.asset("assets/images/home.png",width: 18,),
                  ),
                  label: "Home"
              ),

              BottomNavigationBarItem(
                  activeIcon: Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    // width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeConfig.secondaryColor.withOpacity(0.1),

                    ),
                    child: Image.asset("assets/images/select_home.png",color: ThemeConfig.secondaryColor,width: 20,),
                  ),
                  // activeIcon: SizedBox(
                  //     height: 40,
                  //     child: Image.asset("assets/images/home f.png",width: 24,color: ThemeConfig.primary,)),
                  icon: SizedBox(
                    height: 40,
                    child: Image.asset("assets/images/home.png",width: 18,),
                  ),
                  label: "Menu"
              ),

              BottomNavigationBarItem(
                  activeIcon: Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeConfig.secondaryColor.withOpacity(0.1),
                    ),
                    child:  Image.asset("assets/images/select_orders.png",color: ThemeConfig.secondaryColor,width: 20,),
                  ),
                  icon: SizedBox(
                    height: 40,
                    child: Image.asset("assets/images/orders.png",width: 18,),
                  ),
                  label: "Orders"
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: ThemeConfig.secondaryColor,
            onTap: _onItemTapped,

          ),
        ),
      ),
      //drawer: CreatingDrawer(),
    );
  }
}

