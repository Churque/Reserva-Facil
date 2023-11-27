import 'package:flutter/material.dart';
import '../../navigation_provider.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final navigatorKey =
        NavigationProvider.of(context)?.navigatorKey ?? GlobalKey();

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Menús',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Historial',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      selectedItemColor: Color(0xff00376e),
      currentIndex: selectedIndex,
      onTap: (index) => _onItemSelected(index, navigatorKey),
    );
  }

  void _onItemSelected(int index, GlobalKey<NavigatorState> navigatorKey) {
    if (index == 0) {
      navigatorKey.currentState?.pushNamed('/');
    } else if (index == 1) {
      navigatorKey.currentState?.pushNamed('/historial');
    } else if (index == 2) {
      navigatorKey.currentState?.pushNamed('/scanner');
    }
  }
}
