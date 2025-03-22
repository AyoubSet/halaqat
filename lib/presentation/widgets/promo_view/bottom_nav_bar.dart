import 'package:flutter/material.dart';
import 'package:halaqat/presentation/state/index_nav_bar_state.dart';
import 'package:provider/provider.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          context.read<IndexNavBarState>().updateIndex(index);      
        });
      },
      currentIndex: context.watch<IndexNavBarState>().index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Students',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Halaqat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.stacked_bar_chart_outlined),
          label: 'Tanafus',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Other',
        ),
      ],
    );
  }
}
