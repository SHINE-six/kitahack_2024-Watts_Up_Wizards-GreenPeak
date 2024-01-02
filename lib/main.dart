// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Page/home_page.dart';
import 'Page/login_page.dart';
import 'Page/control_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'RobotoMono', ),
        routes: {
          // '/': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/control': (context) => const ControlPage(),
        },
        home: LoginPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
    int selectedPageIndex = 0;

}

class BasePage extends StatelessWidget {
  final Widget child;
  final AppBar? appBar;

  const BasePage({
    super.key,
    required this.child,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}


class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: appState.selectedPageIndex,
      onDestinationSelected: (value) {
        setState(() {
          appState.selectedPageIndex = value;
        });
        switch (appState.selectedPageIndex) {
          case 0:
            print('home');
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/profile');
            break;
          case 2:
            Navigator.pushNamed(context, '/control');
            break;
          case 3:
            Navigator.pushNamed(context, '/setting');
            break;
        }
      },
      destinations: [
        const NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        const NavigationDestination(
          icon: Icon(Icons.control_camera_sharp),
          label: 'Control',
        ),
        const NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
      ],
    );
  }
}
