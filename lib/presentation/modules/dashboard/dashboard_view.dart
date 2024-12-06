import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:super_labs_task/presentation/modules/dashboard/home_page.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const Center(child: SizedBox(width: 360, child: HomePage())),
        Container(),
        Container(),
        Container(),
        Container(),
      ][selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Foundation.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Octicons.flame), label: "Trending"),
          BottomNavigationBarItem(
              icon: Icon(MaterialIcons.favorite_outline), label: "Favourites"),
          BottomNavigationBarItem(
              icon: Icon(MaterialCommunityIcons.cart_outline), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesome5Regular.user_circle), label: "Profile"),
        ],
      ),
    );
  }
}
