import 'package:flutter/material.dart';

class NavigationProvider extends InheritedWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationProvider({
    required this.navigatorKey,
    required Widget child,
  }) : super(child: child);

  static NavigationProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NavigationProvider>();
  }

  @override
  bool updateShouldNotify(NavigationProvider oldWidget) {
    return navigatorKey != oldWidget.navigatorKey;
  }
}
