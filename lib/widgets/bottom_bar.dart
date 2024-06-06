import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
        iconSize: 32,
        selectedItemColor: PrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_rounded),
            label: 'Bookmark',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onTapBar,
      );
  }

    void onTapBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

}